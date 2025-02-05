# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Bart Louwers <sleeping@emeel.net>

pkgname=ut
pkgver=2.3.0
pkgrel=1
pkgdesc="UT: C++20 μ(micro)/Unit Testing Framework"
arch=("any")
url="https://boost-ext.github.io/ut"
license=("BSL-1.0")
makedepends=("cmake")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/boost-ext/ut/archive/v${pkgver}.tar.gz")
b2sums=("2b8c8225a533520c104f89ec63bcff449e70260ceda60805f93efc91f02731189ae73f07f5ead411773eead42914d34a149df86de1b24b7d94d8e3a59fb61b3c")

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
