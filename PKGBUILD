# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=sobjectizer
pkgver=5.7.4.2
pkgrel=1
pkgdesc="An implementation of Actor, Publish-Subscribe, and CSP models
         in one rather small C++ framework"
arch=("x86_64")
url="https://stiffstream.com/en/products/sobjectizer.html"
license=("custom:BSD")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Stiffstream/sobjectizer/archive/v.${pkgver}.tar.gz")
b2sums=("f83c42691aec6f0733246f9563ee534f9d13c4c3d666d1250b0fdd54adaf3f68e73d989aaf50d475e5cccb6e76f61ed7bc3e87baab36fb28f75cd8463ff782ce")

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
