# $Id$
# Maintainer:
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bzrtp-git
_pkgname=bzrtp
pkgver=1.0.6.r5.g49a0bb2
pkgrel=1
pkgdesc="Opensource implementation of ZRTP keys exchange protocol"
arch=('i686' 'x86_64')
url="https://github.com/BelledonneCommunications/bzrtp"
license=('GPL2')
conflicts=('bzrtp')
provides=('bzrtp')
depends=('libxml2' 'mbedtls' 'bctoolbox-git')
makedepends=('cmake')
validpgpkeys=('9774BC1725758EB16D639F8B3ECD52DEE2F56985')
source=("git+https://github.com/BelledonneCommunications/bzrtp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}
build() {
  cd ${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DENABLE_STATIC=NO \
      -DCMAKE_INSTALL_LIBDIR="/usr/lib" .
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
