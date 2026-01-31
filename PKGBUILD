# Contributor: Lex Black <autumn-wind@web.de>

pkgname=chemicalfun
pkgver=0.1.13
pkgrel=1
pkgdesc="C++ library (Python and C++ API) for generating balanced chemical reactions and for parsing and calculating properties of chemical formulas"
arch=('x86_64')
url="https://github.com/thermohub/chemicalfun"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
makedepends=(
    'cmake'
    'eigen3'
    'fmt'
    'nlohmann-json'
    #'pybind11' # pybind11 fails to find the Eigen headers
    'python-setuptools'
    'spdlog'
)
provides=('libChemicalFun.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe009d0b9ed491f57fe48048fd677e4746c32422c466bd1b61013782a7e58654')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_SKIP_RPATH=YES
    -D CHEMICALFUN_BUILD_PYTHON=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
