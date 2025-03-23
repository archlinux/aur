# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=prometheus-cpp
pkgver=1.3.0
_tag=v${pkgver}
pkgrel=1
pkgdesc="Prometheus Client Library for Modern C++"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/jupp0r/${pkgname}"
license=("MIT")
depends=(curl zlib)
makedepends=(cmake clang)
# dependencies
# * Threads
# * benchmark
#-- The following REQUIRED packages have been found:
# * googlemock-3rdparty
# * civetweb-3rdparty
# * ZLIB
# * CURL

source=("${pkgname}-${_tag}.tar.gz::https://github.com/jupp0r/${pkgname}/releases/download/${_tag}/${pkgname}-with-submodules.tar.gz")
sha256sums=("62bc2cc9772db2314dbaae506ae2a75c8ee897dab053d8729e86a637b018fdb6")

prepare() {
  cd ""
  cd "${pkgname}-with-submodules"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "${pkgname}-with-submodules/build"
  cmake --build .
}

check() {
  cd "${pkgname}-with-submodules/build"
  ctest -VV
}

package() {
  cd "${pkgname}-with-submodules/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
