# Maintainer: sockeye-d (fishy, fishnpotatoes)
pkgname=godl
pkgver=1.2.2
pkgrel=1
pkgdesc="Godot project and version manager"
arch=('x86_64')
url="https://github.com/sockeye-d/godl"
license=('MIT')
depends=('git' 'qt6-base' 'qt6-declarative' 'kdeclarative' 'kirigami' 'kirigami-addons' 'breeze-icons' 'qqc2-desktop-style' 'kconfigwidgets')
makedepends=('cmake' 'extra-cmake-modules')

prepare() {
  git clone https://github.com/sockeye-d/godl godl-$pkgver
  cd godl-$pkgver || exit
  git switch --detach v$pkgver
}

build() {
  cd "godl-$pkgver" || exit
  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=MinSizeRel
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "godl-$pkgver" || exit
  DESTDIR="$pkgdir" cmake --install build
}
