# $Id$
# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

_pkgname=lwp
pkgname=lib32-${_pkgname}
pkgver=2.6
pkgrel=1
pkgdesc="Light weight process library"
arch=(x86_64)
url="http://www.coda.cs.cmu.edu"
license=("LGPL")
depends=(${_pkgname})
validpgpkeys=('477F78AA863A90A623664AA1CE0D7E10997007A2')
source=(http://www.coda.cs.cmu.edu/pub/lwp/src/lwp-${pkgver}.tar.gz{,.asc})
sha256sums=('4887fd7f74564552f53dfe42440f4777808a82b1249b2733ecfd062849a4d32d'
            'SKIP')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/include
}
