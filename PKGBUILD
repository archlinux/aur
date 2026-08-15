# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.5.0
pkgrel=1
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=("d9d185616d38c5243d7659e85d25c5e0d3ab6d0299830a0332948934cbf39ad7bee85af3d339c952b811d2a6a6b9b511b3fb19a9d5cfcf5f7b2d49013c325401")

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
