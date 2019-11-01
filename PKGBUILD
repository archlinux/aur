# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libraw
pkgname=lib32-libraw
pkgver=0.19.5
pkgrel=1
pkgdesc="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others) (32-bit)"
arch=('x86_64')
url="https://www.libraw.org/"
license=(CDDL LGPL)
depends=(lib32-lcms2 lib32-jasper libraw)
source=($_basename-$pkgver.tar.gz::"https://github.com/LibRaw/LibRaw/archive/$pkgver.tar.gz")
sha256sums=('9a2a40418e4fb0ab908f6d384ff6f9075f4431f8e3d79a0e44e5a6ea9e75abdc')

build() {
    cd LibRaw-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./mkdist.sh

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-examples

    make
}

package() {
    cd LibRaw-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}/usr/include"
    rm -rf "${pkgdir}/usr/share"
}
