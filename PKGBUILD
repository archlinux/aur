# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Benjamin Chretien <chretien dot b +aur at gmail dot com>

pkgname=casadi
pkgver=3.4.5
pkgrel=2
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('GPL3')
depends=('python' 'gcc-fortran' 'lapack' 'tinyxml' 'swig' 'sundials' 'ipython'
         'python-numpy' 'python-scipy' 'python-matplotlib' 'coin-or-ipopt')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/casadi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2732a90b49084c38c88e0fb59b49635456f6f19712436a64c998133e52fd396f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWITH_PYTHON=ON \
    -DWITH_PYTHON3=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
    -DWITH_LAPACK=ON \
    -DWITH_SUNDIALS=ON \
    -DWITH_TINYXML=ON \
    -DWITH_IPOPT=ON \
    -DWITH_CLANG=OFF \
    ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
}
