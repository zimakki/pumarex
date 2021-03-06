module Decoders exposing (..)

import Json.Decode as JD exposing (..)
import Json.Decode.Extra exposing ((|:))
import Model exposing (..)


type alias MovieResponse =
    { movie : Maybe Movie
    , error : Maybe String
    }


movieListDecoder : JD.Decoder MovieList
movieListDecoder =
    succeed
        MovieList
        |: (field "entries" (list movieDecoder))
        |: (field "page_number" int)
        |: (field "total_entries" int)
        |: (field "total_pages" int)


movieDecoder : JD.Decoder Movie
movieDecoder =
    succeed
        Movie
        |: (field "id" int)
        |: (field "title" string)
        |: (field "year" int)
        |: (field "duration" int)
        |: (field "director" string)
        |: (field "cast" string)
        |: (field "overview" string)
        |: (field "poster" string)
