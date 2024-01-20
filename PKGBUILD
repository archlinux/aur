# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=sobjectizer
pkgver=5.8.1.1
pkgrel=1
pkgdesc="An implementation of Actor, Publish-Subscribe, and CSP models
         in one rather small C++ framework"
arch=("x86_64")
url="https://stiffstream.com/en/products/sobjectizer.html"
license=("LicenseRef-Custom-BSD-3-Clause")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Stiffstream/sobjectizer/archive/v.${pkgver}.tar.gz")
b2sums=("653ddeef9dd996fb4049a3ace260e27b2901709e33b59d2c41c54324b08a35cdf9995e5a41584ddb5b6bfdb1285650060c9c0e0dd48751a241afb19b79c95599")

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
