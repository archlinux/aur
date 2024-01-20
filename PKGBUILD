# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Ruijie Yu (first.last@outlook.com)

pkgname=ctre
pkgver=3.8.1
pkgrel=1
pkgdesc="Fast compile-time regular expressions with support for
         matching/searching/capturing during compile-time or runtime"
url="https://compile-time.re"
arch=("any")
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanickadot/compile-time-regular-expressions/archive/v${pkgver}.tar.gz")
b2sums=("30ee11613b9f0623c5f40c1580d3a6f2e2d583d5783d5fe77fb485375f307081ee2c35f6f5968a7a89c9827fa5cee9fdd2c07addad08a870ee73ef93c984ec0d")

build() {
  cmake -B "build/" -S "compile-time-regular-expressions-${pkgver}" \
    -D CTRE_BUILD_TESTS:BOOL="OFF" \
    -D CTRE_BUILD_PACKAGE:BOOL="OFF" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
