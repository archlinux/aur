# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=sobjectizer
pkgver=5.8.6
pkgrel=1
pkgdesc="An implementation of Actor, Publish-Subscribe, and CSP models
         in one rather small C++ framework"
arch=("x86_64")
url="https://stiffstream.com/en/products/sobjectizer.html"
license=("LicenseRef-Custom-BSD-3-Clause")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Stiffstream/sobjectizer/archive/v${pkgver}.tar.gz")
b2sums=("29172478482a6d641ec644b3b8dbd752be46cf90d39d6ad355acfe0a4babfc8e501a1b14b63fcc7c82dacc42ffc3232f298af21e836cae9ba40b9f7f23fcc88f")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}/dev" \
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
    "${pkgname}-${pkgver}/LICENSE"
}
