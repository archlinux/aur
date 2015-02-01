#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Library for collision detection between two convex shapes."
url='http://libccd.danfis.cz/'
pkgname=libccd
pkgver=2.0
arch=('i686' 'x86_64')
pkgrel=3
license=('BSD')
makedepends=('cmake')
depends=()
source=(http://libccd.danfis.cz/files/libccd-${pkgver}.tar.gz)
md5sums=('919415277e3baa1d157e713c0b597ab0')
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
