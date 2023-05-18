# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=fakeit
pkgver=2.4.0
pkgrel=1
pkgdesc="C++ mocking made easy.
         A simple yet very expressive, headers only library for c++ mocking"
arch=("any")
url="https://github.com/eranpeer/FakeIt"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eranpeer/FakeIt/archive/${pkgver}.tar.gz")
b2sums=("23039cb5189d54cfdf6c50bfe8aed426de8b7ff8af683ff1ec7532d2768159c470921628808162ddcf5ddf641132054beacca883aa7de80190795015fd59c9ff")

build() {
  cmake -B "build/" -S "FakeIt-${pkgver}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
  
  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "FakeIt-${pkgver}/LICENSE"
}
