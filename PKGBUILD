# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-blas
pkgver=0.17.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor>=0.17.0' 'blas' 'lapack')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a574f90ab89dd86abad9045ae3873fcfc16022d01a85453a9c74ed11edae1fa5ae2e9f0781553cb8145dc043e7540608a190878a30312a0404ea48c3ee7a8453')

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
