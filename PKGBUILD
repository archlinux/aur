# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libheif
pkgname=lib32-libheif
pkgver=1.14.2
pkgrel=1
pkgdesc="HEIF file format decoder and encoder (32-bit)"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
depends=(lib32-aom lib32-gdk-pixbuf2 lib32-libdav1d lib32-libde265 lib32-x265 libheif)
makedepends=(lib32-libjpeg lib32-libpng)
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('d016905e247d6952cd7ee4f9b90957350b6a6caa466bc76fdfe6eb302b6d088c')

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --enable-static=no \
        --disable-go \
        --disable-examples

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
