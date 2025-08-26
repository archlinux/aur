# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libgme
pkgname="lib32-$_basename"
pkgver=0.6.4
pkgrel=1
pkgdesc='Video game music file emulation/playback library (32-bit)'
arch=(x86_64)
url='https://github.com/libgme/game-music-emu'
license=(LGPL-2.1-or-later)
depends=(
    lib32-gcc-libs
    lib32-glibc
    lib32-zlib
    libgme
)
makedepends=(
    cmake
    git
    lib32-sdl2
    ninja
)
source=("git+https://github.com/libgme/game-music-emu.git#tag=$pkgver")
b2sums=(32a0582bd197a7a7f11fb0745d34545745dd1901d9a39b0e1abc0b24a3d9ab3b59dc6e228dc7e7eea9494474ded1beadce172121518bba3bf422820c74cdd84e)
validpgpkeys=(5406ECE83665DA9D201D35720BAF0C9C7B6AE9F2) # Michael Pyne <mpyne@kde.org>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    cmake -S game-music-emu -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib32

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    cd "$pkgdir/usr"

    rm -r include
}
