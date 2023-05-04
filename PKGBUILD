# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libde265
pkgname=lib32-libde265
pkgver=1.0.11
pkgrel=1
pkgdesc='Open h.265 video codec implementation (32-bit)'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL3)
depends=(lib32-gcc-libs libde265)
source=(https://github.com/strukturag/libde265/releases/download/v$pkgver/$_basename-$pkgver.tar.gz)
sha256sums=('2f8f12cabbdb15e53532b7c1eb964d4e15d444db1be802505e6ac97a25035bab')

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
        --disable-sherlock265

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r bin include
}
