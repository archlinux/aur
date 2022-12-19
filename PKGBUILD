# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.3.9
pkgrel=2
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=("2519b7b4a2c8b2da9acb83d5d09883d350f774cb93ba1c2cbb9c6274968308c27d163de00cd531982ab4434a01d714daa706104765cce70b6b605cdf2edb0c9e")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING="None" \
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
