# $Id$
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bctoolbox-git
_pkgname=bctoolbox
pkgver=0.5.1.r108.ga21cab9
pkgrel=1
pkgdesc="Utilities library for Belledonne Communications software"
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('bctoolbox')
provides=('bctoolbox')
depends=('mbedtls')
makedepends=('cmake')
source=("git://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake -DENABLE_TESTS_COMPONENT=NO \
      -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" "../$_pkgname" \
      -DENABLE_STATIC="NO"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
