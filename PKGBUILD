# Maintainer: sockeye-d (me@fishies.dev)
pkgname=godl
pkgver=1.2.2
pkgrel=1
pkgdesc="Godot project and version manager"
arch=('x86_64')
url="https://github.com/sockeye-d/godl"
license=('MIT')
source=("git+https://github.com/sockeye-d/godl.git#tag=v${pkgver}")
sha256sums=('SKIP')
depends=('git' 'qt6-base' 'qt6-declarative' 'kdeclarative' 'kirigami' 'kirigami-addons' 'breeze-icons' 'qqc2-desktop-style' 'kconfigwidgets')
makedepends=('cmake' 'extra-cmake-modules')

build() {
  cd "godl" || exit
  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=MinSizeRel
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build -j $(nproc --all)
}

package() {
  cd "godl" || exit
  DESTDIR="$pkgdir" cmake --install build
}
