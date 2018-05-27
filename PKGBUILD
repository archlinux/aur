# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=simbody
pkgver=3.6
pkgrel=1
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
sha256sums=('bafce4b32dda4e174700733da1cd4f5f77f490daa96b92ed64bb881b0a885aa8')

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
