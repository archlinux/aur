#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Library for collision detection between two convex shapes."
url='https://github.com/danfis/libccd'
pkgname=libccd
pkgver=2.0
arch=('i686' 'x86_64')
pkgrel=3
license=('BSD')
makedepends=('cmake')
depends=()
source=(https://github.com/danfis/libccd/archive/v${pkgver}.tar.gz)
sha256sums=('1b4997e361c79262cf1fe5e1a3bf0789c9447d60b8ae2c1f945693ad574f9471')
provides=('libccd')
conflicts=('libccd-git')

_dir=libccd-${pkgver}

build() {
  rm -rf ${srcdir}/build && mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/${_dir} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
