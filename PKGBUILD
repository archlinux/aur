# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Ruijie Yu (first.last@outlook.com)

pkgname=ctre
pkgver=3.11.0
pkgrel=1
pkgdesc="Fast compile-time regular expressions with support for
         matching/searching/capturing during compile-time or runtime"
url="https://compile-time.re"
arch=("any")
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanickadot/compile-time-regular-expressions/archive/v${pkgver}.tar.gz")
b2sums=("3f33de90623ee06e3efc3ca088ce4453ad44ad4bca551bc5e53450d944d9ecfca0c4feca393f4e90c1db7cc84f81ea4dae0c5276f55963fbc14fb48f752525ec")

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
