# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=fakeit
pkgver=2.4.1
pkgrel=1
pkgdesc="C++ mocking made easy.
         A simple yet very expressive, headers only library for c++ mocking"
arch=("any")
url="https://github.com/eranpeer/FakeIt"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eranpeer/FakeIt/archive/${pkgver}.tar.gz")
b2sums=("804abe7ec19249d1beb98ad016432579ac5d1208612aea4fbd1f86b69fa3fba09f164c23bdd57974de9e1fdbc847b33057488e8bcdb33ca1cdfaf76722021b79")

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
