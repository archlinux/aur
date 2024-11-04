# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=sobjectizer
pkgver=5.8.3
pkgrel=1
pkgdesc="An implementation of Actor, Publish-Subscribe, and CSP models
         in one rather small C++ framework"
arch=("x86_64")
url="https://stiffstream.com/en/products/sobjectizer.html"
license=("LicenseRef-Custom-BSD-3-Clause")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Stiffstream/sobjectizer/archive/v.${pkgver}.tar.gz")
b2sums=("2b4dc0d49d1ea442bb840b416077dfe03f37ee19de82ef0ea98cefbdfe554563cdb93bf8632b255b5f6d874b84ac596400396f027597f5b74de7700b9bdbc948")

build() {
  cmake -B "build/" -S "${pkgname}-v.${pkgver}/dev" \
    -D SOBJECTIZER_INSTALL:BOOL="ON" \
    -D CMAKE_CXX_FLAGS:STRING="-fmacro-prefix-map=${srcdir}/=" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-v.${pkgver}/LICENSE"
}
