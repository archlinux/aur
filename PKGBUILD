# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Ruijie Yu (first.last@outlook.com)

pkgname=ctre
pkgver=3.10.0
pkgrel=1
pkgdesc="Fast compile-time regular expressions with support for
         matching/searching/capturing during compile-time or runtime"
url="https://compile-time.re"
arch=("any")
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanickadot/compile-time-regular-expressions/archive/v${pkgver}.tar.gz")
b2sums=("ada6592847e7387e58a60d4647932038e582eedfe54b40fda9a6f7f00e48b1d4065b1595735a912d67a0286641a43f30d6df1f0b34c7daf94dc5fa87e697616f")

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
