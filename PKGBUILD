# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=concurrencpp
pkgver=0.1.7
pkgrel=1
pkgdesc="Modern concurrency for C++.
         Tasks, executors, timers and C++20 coroutines to rule them all"
arch=("x86_64")
url="https://github.com/David-Haim/concurrencpp"
license=("MIT")
depends=("gcc-libs")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/David-Haim/concurrencpp/archive/v.${pkgver}.tar.gz")
b2sums=("6910ece973192829a374aa4cc04fefb2836da6add3deeff92b3f6988305d70506bee621c18732f7480c0c5536073e29d90ad7ff7741c67cd602d1e9b5a647a49")

build() {
  cmake -B "build/" -S "${pkgname}-v.${pkgver}" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-v.${pkgver}/LICENSE.txt"
}
