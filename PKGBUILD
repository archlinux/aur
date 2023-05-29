# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chretien <chretien dot b +aur at gmail dot com>

pkgname=casadi
pkgver=3.6.3
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('GPL3')
depends=('python' 'gcc-fortran' 'lapack' 'tinyxml' 'tinyxml2' 'swig' 'ipython'
         'python-numpy' 'python-scipy' 'python-matplotlib' 'coin-or-ipopt' 'dsdp')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/casadi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('be81a0b7372eb1d1e4d4249cfb455dbd7c6012622000e65ef05bba6192d8f31e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWITH_PYTHON=ON \
    -DWITH_PYTHON3=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DWITH_LAPACK=ON \
    -DWITH_SUNDIALS=OFF \
    -DWITH_BUILD_SUNDIALS=OFF \
    -DWITH_IPOPT=ON \
    -DWITH_TINYXML=ON \
    -DWITH_BUILD_TINYXML=OFF \
    -DWITH_DSDP=ON \
    -DWITH_BUILD_DSDP=OFF \
    -DWITH_CLANG=OFF \
    ..

  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}
