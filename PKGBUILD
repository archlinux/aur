# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Benjamin Chretien <chretien dot b +aur at gmail dot com>

pkgname=casadi
pkgver=3.5.1
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization"
arch=('i686' 'x86_64')
url="https://github.com/casadi/casadi"
license=('GPL3')
depends=('python' 'gcc-fortran' 'lapack' 'tinyxml' 'swig' 'sundials' 'ipython'
         'python-numpy' 'python-scipy' 'python-matplotlib' 'coin-or-ipopt')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/casadi/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('73eb096837bee2d1bbdfb8565f07c4a9d62b30cf831ad1ce3196df1f1770ae4d')

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
