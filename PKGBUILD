# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libheif
pkgname=lib32-libheif
pkgver=1.3.2
pkgrel=2
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
depends=(lib32-libde265 lib32-x265 libheif)
makedepends=(lib32-libjpeg lib32-libpng x265)
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('a9e12a693fc172baa16669f427063edd7bf07964a1cb623ee57cd056c06ee3fc')

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

    rm -rf "$pkgdir/usr/bin"
    rm -rf "$pkgdir/usr/include"
    rm -rf "$pkgdir/usr/share"
}
