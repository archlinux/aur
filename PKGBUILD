# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=nanobench
pkgver=4.3.8
pkgrel=1
pkgdesc="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
arch=("x86_64")
url="https://nanobench.ankerl.com"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/martinus/nanobench/archive/v${pkgver}.tar.gz")
b2sums=('2144418222631bc8c405b28fd2991404f244b3369cebf37367b4d1477617224709692eb2d25ccab53e7f54bf8d6a16d740a8feea0e8da586468c03bf96050e96')

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D CMAKE_BUILD_TYPE:STRING="None" \
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
