# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libheif
pkgname=lib32-libheif
pkgver=1.6.1
pkgrel=1
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
depends=(lib32-gdk-pixbuf2 lib32-libde265 lib32-x265 libheif)
makedepends=(lib32-libjpeg lib32-libpng x265)
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('a22611289464da08fa7e580c95ea5e1b1b522b96ee6807de9b3b4605efb621d1')

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
