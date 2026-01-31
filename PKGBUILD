# Contributor: lmartinez-mirror

pkgname=thermofun
pkgver=0.6.0
pkgrel=1
pkgdesc="Library for calculating standard state thermodynamic properties"
arch=('x86_64')
url="https://github.com/thermohub/thermofun"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
makedepends=(
    'cmake'
    'chemicalfun'
    'eigen3'
    'nlohmann-json'
    'pybind11'
    'python-setuptools'
    'spdlog'
)
provides=('libThermoFun.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b4e964ee002763005ca0a5e299feb186ea162d873667ee59d84fcc4bf267547')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_SKIP_RPATH=YES
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
