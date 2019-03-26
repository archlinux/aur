# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcmatroska2-git
_pkgname=bcmatroska2
pkgver=0.23.r12.gfac98dc
pkgrel=1
pkgdesc="A C library for working with matroska files"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
makedepends=('cmake')
source=("git+https://gitlab.linphone.org/BC/public/$_pkgname.git")
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
