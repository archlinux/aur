# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Bart Louwers <sleeping@emeel.net>

pkgname=ut
pkgver=2.0.1
pkgrel=1
pkgdesc="UT: C++20 μ(micro)/Unit Testing Framework"
arch=("any")
url="https://boost-ext.github.io/ut"
license=("BSL-1.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/boost-ext/ut/archive/v${pkgver}.tar.gz")
b2sums=("39b134278fadc05ce9bfdb289ed33bf25e75b2128e0c6cc092041bd039074f9f8d6cbfcc649e57f91652f91787b86257aa0102b745b541b6594c3b6f86c26f24")

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
