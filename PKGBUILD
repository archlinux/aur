# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libheif
pkgname=lib32-libheif
pkgver=1.4.0
pkgrel=1
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
depends=(lib32-gdk-pixbuf2 lib32-libde265 lib32-x265 libheif)
makedepends=(lib32-libjpeg lib32-libpng x265)
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('977a9831f1d61b5005566945c7e16e31de35a57a8dd6eb715ae0f40a3595cb60')

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-static=no

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
