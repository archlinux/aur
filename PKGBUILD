# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_basename=faad2
pkgname=lib32-faad2
pkgver=2.8.8
pkgrel=2
pkgdesc="ISO AAC audio decoder (32 bit)"
arch=(x86_64)
url="http://faac.sourceforge.net/"
license=(GPL)
depends=(lib32-glibc faad2)
options=('!makeflags')
source=("http://downloads.sourceforge.net/sourceforge/faac/${_basename}-${pkgver}.tar.gz")
sha256sums=('985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d')

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
