# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=fakeit
pkgver=2.5.0
pkgrel=1
pkgdesc="C++ mocking made easy.
         A simple yet very expressive, headers only library for c++ mocking"
arch=("any")
url="https://github.com/eranpeer/FakeIt"
license=("MIT")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eranpeer/FakeIt/archive/${pkgver}.tar.gz")
b2sums=("0354f53b403efad4a3925d7d2deec495dd0246b0a19580cc86228e746fd8201175b989dc8e8e4cef18874b4fd2b75111c9306fa3c3254fc00fce6a265c8fd7f2")

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
