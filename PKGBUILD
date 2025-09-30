# Maintainer: Emma <contact@emmaexe.moe>
pkgname=ntfydesktop
pkgver=1.6.0
pkgrel=1
pkgdesc="Subscribe to topics from any ntfy server and receive notifications natively on the desktop."
arch=("x86_64" "aarch64")
url="https://github.com/emmaexe/ntfyDesktop"
license=("GPL-3.0-only")
depends=("curl" "qt6-base" "kcoreaddons" "ki18n" "knotifications" "kxmlgui")
makedepends=("git" "gcc" "cmake" "extra-cmake-modules" "ninja" "gperf")
source=("https://github.com/emmaexe/ntfyDesktop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("78ba23a78ea2adffc7ee7abb5c659a77109c45a8799a8e73c8bc0bc7caf093fc")

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S ntfyDesktop-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
