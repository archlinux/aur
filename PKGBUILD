# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-blas
pkgver=0.13.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor>=0.17.0' 'blas' 'lapack')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dc3f68189493c43b1651f96ffb20e71ce1447ca2df138c8955b596b34d446f8ffcb71fcbd867293ab645ba8170a099dd30ad8a48c7627995d9061fcdb0cd5caf')

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
