# Maintainer: Robert Greener <dev at greener dot sh>
pkgname=insync-dolphin-plasma-6-git
pkgver=r26.54c70f2
pkgrel=1
pkgdesc="Insync plugin for Dolphin on Plasma 6"
arch=("x86_64")
license=("GPL-2.0")
makedepends=("cmake" "extra-cmake-modules")
source=("$pkgname::git+https://github.com/felagund/dolphin-insync-plugin-plasma-6.git")
b2sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
