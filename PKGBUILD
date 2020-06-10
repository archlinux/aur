# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

pkgname=dftd3
pkgver=3.2.0
pkgrel=1
pkgdesc="A dispersion correction for density functionals, Hartree-Fock and semi-empirical quantum chemical methods"
arch=('x86_64')
url="https://www.chemie.uni-bonn.de/pctc/mulliken-center/software/dft-d3/dft-d3"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'gcc-fortran')
# This commit corresponds to 3.2.0, but with a CMakeLists.txt for building,
# rather than depending on the Makefile.
source=("git+https://github.com/loriab/dftd3.git#commit=da24707317cb6939b1fec60e1281a65f48ba7d73")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..

  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
