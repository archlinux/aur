# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.3.7
pkgrel=1
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=("f0094be49843bdea1a43e02733ff33aaa2c7bfef583c57e22704f5f9602d60599f7a65275585f879732b18ea067dc78c0e3dbb7c647f58739d0202424fbc8a3e")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING="None" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
