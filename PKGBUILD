# $Id$
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2-git
_pkgname=libmatroska-c
pkgver=0.23.r11.gd2e052b
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
makedepends=('cmake')
source=("git://git.linphone.org/$_pkgname.git")
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
      ../$_pkgname
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
