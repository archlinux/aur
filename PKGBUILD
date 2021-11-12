# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-blas
pkgver=0.20.0
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor>=0.19.0' 'blas' 'lapack')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0733f4d079c1f715cca92bbddd4f02170406f00e980135c3614de7e7515f3d58e69678538dd6cfc3273663487f9ac481bf94fe3f81df775843cff3ffe819fc52')

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
