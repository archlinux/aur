# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=xtensor
pkgver=0.17.3
pkgrel=1
pkgdesc="QuantStack tools library - Multi-dimensional arrays with broadcasting and lazy computing."
arch=('x86_64')
url="https://github.com/QuantStack/${pkgname}"
license=('BSD-3-Clause')
depends=('gcc' 'xtl' 'nlohmann-json')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QuantStack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2edb94c43d9acb249ac7e70f2e592bb05e8afbd8320d44aebcf52c9a7f6b754644fbdf688ef660fb42fec265930300eda7671818f8c8346759de2496d555d236')

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
