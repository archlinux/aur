# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Bart Louwers <sleeping@emeel.net>

pkgname=ut
pkgver=2.0.0
pkgrel=1
pkgdesc="UT: C++20 μ(micro)/Unit Testing Framework"
arch=("any")
url="https://boost-ext.github.io/ut"
license=("Boost")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/boost-ext/ut/archive/v${pkgver}.tar.gz")
b2sums=("fde257f7553163028a4959925965d3ec4c45babb681dec454209352ede255fc250b146a93c21a954d877d163ebd47b12000ae03b5e20cf9c1a9046a274935b22")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D BOOST_UT_ALLOW_CPM_USE:BOOL="OFF" \
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
