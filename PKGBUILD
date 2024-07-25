# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Bart Louwers <sleeping@emeel.net>

pkgname=ut
pkgver=2.1.0
pkgrel=1
pkgdesc="UT: C++20 μ(micro)/Unit Testing Framework"
arch=("any")
url="https://boost-ext.github.io/ut"
license=("BSL-1.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/boost-ext/ut/archive/v${pkgver}.tar.gz")
b2sums=("d87531f50d61c3ff4104e832c6ff7e55a1d2a24e30411ffcdc8956e0fa47799a1d9a5a7a8716aadb10adfcac2d0ce63fd556e07d39e527484526309d18760df3")

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
