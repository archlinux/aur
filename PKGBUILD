# $Id$
# Maintainer:
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard-git
_pkgname=belcard
pkgver=1.0.2.r10.gb9e1951
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('belcard')
provides=('belcard')
depends=('belr')
makedepends=('cmake')
source=("git://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
