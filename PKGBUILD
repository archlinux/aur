# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=sobjectizer
pkgver=5.7.4.3
pkgrel=1
pkgdesc="An implementation of Actor, Publish-Subscribe, and CSP models
         in one rather small C++ framework"
arch=("x86_64")
url="https://stiffstream.com/en/products/sobjectizer.html"
license=("custom:BSD")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Stiffstream/sobjectizer/archive/v.${pkgver}.tar.gz")
b2sums=("771ae1fea9188467e29a15651035dd72c08b07a57a026680d4e1fb9fdc3d1d22adb3e2b993001cdb36497dd8ff022d7df99681e2e60c51753584c075adea68f8")

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
