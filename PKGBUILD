# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libraw1394
pkgname=lib32-${_pkgname}
pkgver=2.1.2
pkgrel=3
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver (32 bit)"
arch=('x86_64')
url="https://ieee1394.wiki.kernel.org/index.php/Main_Page"
license=('LGPL2.1')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib')
source=(https://www.kernel.org/pub/linux/libs/ieee1394/${_pkgname}-${pkgver}.tar.xz)
md5sums=('118060584c04f1aa5e29c4d22c1c235a')


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
