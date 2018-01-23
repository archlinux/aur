# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcg729-git
_pkgname=bcg729
pkgver=1.0.4.r0.g9ada79d
pkgrel=1
pkgdesc="A C implementation of the ITU G729 Annex A/B codec"
arch=('x86_64')
url="https://github.com/BelledonneCommunications/bcg729"
license=('GPL2')
conflicts=('bcg729')
provides=('bcg729')
depends=()
makedepends=('cmake')
source=("git+https://github.com/BelledonneCommunications/bcg729.git")
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
