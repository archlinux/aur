# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Ruijie Yu (first.last@outlook.com)

pkgname=ctre
pkgver=3.9.0
pkgrel=1
pkgdesc="Fast compile-time regular expressions with support for
         matching/searching/capturing during compile-time or runtime"
url="https://compile-time.re"
arch=("any")
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hanickadot/compile-time-regular-expressions/archive/v${pkgver}.tar.gz")
b2sums=("a54564e61d4081b1ae19b2d4198dd7cfce842b52026b25d4ed315529b5e5d680c507baad5d50df5f7a788437856f51ea84cf8a7037883556d0ec5847e5888eee")

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
