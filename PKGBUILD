# Maintainer: Benjamin Valdez <bvaldez0509 at gmail.com>
pkgname=inputactions-ctl
pkgver=0.9.0.0
pkgrel=1
pkgdesc="InputActions Control Tool"
arch=('x86_64')
url="https://github.com/InputActions/ctl"
license=('GPL-3.0-or-later')
depends=(
  'libgcc'
  'libstdc++'
  'qt6-base'
  'glibc'
)
makedepends=('cmake' 'extra-cmake-modules' 'cli11')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  local cmake_options=(
    -B build
    -S "ctl-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel "$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
sha256sums=('becf203a9c0df3563bb6c8e5b4f36296c171b34debb7c560c6db8adac41e8110')
