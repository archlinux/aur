# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_basename=libde265
pkgname=lib32-libde265
pkgver=1.0.16
pkgrel=1
pkgdesc='Open h.265 video codec implementation (32-bit)'
arch=(x86_64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(
    lib32-gcc-libs
    lib32-glibc
    libde265
)
makedepends=(
    git
)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('103ad98bbfbee5e93011c5197c9106ce849e2479e3ce2a49edf5882b15654015')

prepare() {
    cd $_basename

    ./autogen.sh
}


build() {
    cd $_basename

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
    cd $_basename

    make DESTDIR="$pkgdir" install

    cd "$pkgdir/usr"

    rm -r bin include
}
