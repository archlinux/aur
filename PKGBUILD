# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=benchmark
pkgver=1.5
pkgrel=1
pkgdesc="A microbenchmark support library, by Google"
arch=('any')
url="https://github.com/google/benchmark"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake')

source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('feba1c44cbace01627435a675aa271f4b012068dbea9922443c58fedd56eb5eb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib \
           -DBUILD_SHARED_LIBS=ON \
           -DBENCHMARK_ENABLE_LTO=ON \
           -DBENCHMARK_ENABLE_GTEST_TESTS=OFF
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
