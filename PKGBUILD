# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=libdc1394
pkgname=lib32-${_basename}
pkgver=2.2.7
pkgrel=1
pkgdesc="Library to control IEEE 1394 based cameras (32 bit)"
arch=(x86_64)
license=('LGPL')
url="http://sourceforge.net/projects/libdc1394/"
depends=('lib32-glibc' 'lib32-libraw1394' 'lib32-libusb' 'libdc1394')
source=("https://downloads.sourceforge.net/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('537ceb78dd3cef271a183f4a176191d1cecf85f025520e6bd3758b0e19e6609f')

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
