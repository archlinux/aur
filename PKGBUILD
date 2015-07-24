# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libraw1394
pkgname=lib32-${_pkgname}
pkgver=2.1.1
pkgrel=1
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver (32 bit)"
arch=('x86_64')
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
license=('LGPL2.1')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
source=(ftp://ftp.kernel.org/pub/linux/libs/ieee1394/${_pkgname}-${pkgver}.tar.xz)
md5sums=('382191c753ca9241655a288f2caac73c')


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package () {
cd ${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}"/usr/{bin,include,share}
}

