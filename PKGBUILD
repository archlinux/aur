# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Ruijie Yu (first.last@outlook.com)

pkgname=ctre
pkgver=3.8
pkgrel=1
pkgdesc="Fast compile-time regular expressions with support for
         matching/searching/capturing during compile-time or runtime"
url="https://compile-time.re"
arch=("any")
license=("Apache")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanickadot/compile-time-regular-expressions/archive/v${pkgver}.tar.gz")
b2sums=("21927b2899bee8e1b382edd9fde0a8a2e2630a2854e22cd4923141b18475208e9d5ed16c99196eabf57ff73f71e99eecd6c93027c75d59b543d24c35e309e64a")

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
