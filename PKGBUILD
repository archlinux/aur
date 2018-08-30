# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-python
pkgver=0.20.0
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'pybind11' 'python-numpy')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('29fdb6a545f5b31a62d3141044bf521cb9ffffbe23f8b23d564dd01c306a8ff3fd0e134f9b7c715c12c943652762f7c284ef15a88feb9366646a675c9f60baa6')

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
