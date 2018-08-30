# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=xtensor-io
pkgver=0.5.1
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('xtensor' 'xtl' 'openimageio' 'libsndfile' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fd8563eed78e44ab392c4fee61df2873bb1e3a7f291b773143531fff4b367df5b4e9b2405787c4d9a4d4691ec14df2af8623cf83d6886c0719ef1cbe2d307cce')

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
