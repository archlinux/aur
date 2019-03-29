# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdc1394
pkgname=lib32-${_basename}
pkgver=2.2.5
pkgrel=3
pkgdesc="High level programming interface to control IEEE 1394 based cameras (32 bit)"
arch=(x86_64)
license=('LGPL')
url="http://sourceforge.net/projects/libdc1394/"
depends=(lib32-libraw1394 lib32-libusb libdc1394)
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('350cc8d08aee5ffc4e1f3049e2e1c2bc6660642d424595157da97ab5b1263337')

build() {
    cd ${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd ${_basename}-${pkgver}

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
