# $Id$
# Maintainer:
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr-git
_pkgname=belr
pkgver=0.1.3.r54.g1584d38
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('belr')
provides=('belr')
depends=('bctoolbox-git')
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
  cmake -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO \
      -DENABLE_TOOLS=NO "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
