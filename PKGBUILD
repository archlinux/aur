# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander Susha <isushik94@gmail.com>

pkgname=xtensor-python
pkgver=0.24.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'pybind11' 'python-numpy')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3b96e932423e24b82e7e39a0573ab7cc6944ab1e7a53606778bfba7c26a644467e34bc3748ae56b60f25e77f3d184cbc370500e1ac76cb08fe57121cacdbc05a')

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
