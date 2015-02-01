# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=simbody
pkgver=3.5.1
pkgrel=2
pkgdesc="High-performance C++ multibody dynamics/physics library for simulating articulated biomechanical and mechanical systems like vehicles, robots, and the human skeleton."
arch=('i686' 'x86_64')
url="https://simtk.org/home/simbody"
license=('Apache')
depends=('lapack' 'blas')
optdepends=('freeglut' 'libxi' 'libxmu' 'doxygen')
makedepends=('cmake')
provides=()
conflicts=()

_dir="${pkgname}-Simbody-${pkgver}"
source=("https://github.com/simbody/${pkgname}/archive/Simbody-${pkgver}.tar.gz")
md5sums=('3d76ffb491d610820b299296fe637eb9')


build() {
  # Create build directory
  mkdir -p ${srcdir}/build && cd ${srcdir}/build

  # Build project
  # Note: CMAKE_INSTALL_LIBDIR is used to avoid the
  # "/usr/lib64 exists in filesystem" error
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd "${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
