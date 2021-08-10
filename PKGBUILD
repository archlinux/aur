# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-blas
pkgver=0.19.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor>=0.19.0' 'blas' 'lapack')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('43d8d51d69ed151eccca17495c41964f82ad58ac718b2a8b0850a37a991e975b7fee24da1cdfc2adc4c97a3c2da0677306ab3191031069a230f28fc677a278cb')

build() {
  cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make install
}
