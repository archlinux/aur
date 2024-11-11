# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Bart Louwers <sleeping@emeel.net>

pkgname=ut
pkgver=2.1.1
pkgrel=1
pkgdesc="UT: C++20 μ(micro)/Unit Testing Framework"
arch=("any")
url="https://boost-ext.github.io/ut"
license=("BSL-1.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/boost-ext/ut/archive/v${pkgver}.tar.gz")
b2sums=("b91702408b678555728329d980dd6ac7654f133aaac9cea376f2b23293eb8f48e030b727ef0e590023324db50e78487a21d815bc9f713cab2233a0f79cc1d2c1")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D BOOST_UT_BUILD_BENCHMARKS:BOOL="OFF" \
    -D BOOST_UT_BUILD_EXAMPLES:BOOL="OFF" \
    -D BOOST_UT_BUILD_TESTS:BOOL="OFF" \
    -D BOOST_UT_USE_WARNINGS_AS_ERORS:BOOL="OFF" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
