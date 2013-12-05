#!/bin/bash

SERVE="serve-public-library"

function make {
    ghc --make -O2 -threaded -hidir ghc_output -odir ghc_output Registry/Server.hs -o $SERVE
}

function restart {
    pkill $SERVE
    ./$SERVE &
}

if [ $1 = "make" ]; then
    make
elif [ $1 = "start" ]; then
    restart
fi
    