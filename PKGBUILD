# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.6.0
pkgrel=1
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=("30da283166219d92149b4a971247e3edfb7f320a3486951608af722012a866bb651085572568414862df125b6917b4ff9de1e8cd4c9caf8ad3afe2ac081045b6")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D NANOBENCH_BUILD_TEST:BOOL="OFF" \
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
