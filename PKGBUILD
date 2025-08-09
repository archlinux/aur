# Maintainer: Emma <contact@emmaexe.moe>
pkgname=ntfydesktop
pkgver=1.5.1
pkgrel=1
pkgdesc="Subscribe to topics from any ntfy server and receive notifications natively on the desktop."
arch=("x86_64" "aarch64")
url="https://github.com/emmaexe/ntfyDesktop"
license=("GPL-3.0-only")
depends=("curl" "qt6-base" "kcoreaddons" "ki18n" "knotifications" "kxmlgui")
makedepends=("git" "gcc" "cmake" "extra-cmake-modules" "ninja")
source=("https://github.com/emmaexe/ntfyDesktop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1b9a94676070b33b848daf7bc7bf5c5043a55f77388ea936a768c65ea5d7436b")

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S ntfyDesktop-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D QT_DEFAULT_MAJOR_VERSION=6 # TODO: Remove after v1.5.1, will be fixed in CMakeLists.txt
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
