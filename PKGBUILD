# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.3.10
pkgrel=1
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=("d6776b5b878f0cf1c3ad83ab9027cadce76d0209b506a0c741dfe6251a9324171e9b8e726b92d2647c1d48d848839c51dd8a9635a9dc9aec767d1948b65c6e36")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/" --target "nanobench"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgname}-${pkgver}/LICENSE"
}
