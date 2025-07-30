# Maintainer: Emma <contact@emmaexe.moe>
pkgname=ntfydesktop
pkgver=1.5.0
pkgrel=1
pkgdesc="Subscribe to topics from any ntfy server and receive notifications natively on the desktop."
arch=("x86_64")
url="https://github.com/emmaexe/ntfyDesktop"
license=("GPL-3.0-only")
depends=("curl" "qt6-base" "kcoreaddons" "ki18n" "knotifications" "kxmlgui")
makedepends=("git" "gcc" "cmake" "extra-cmake-modules" "ninja")
source=("https://github.com/emmaexe/ntfyDesktop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6f9a87e8959f6b4a87e24bd9db1b9797f8386d22e02e386a18e7bdbb66a1e96d")

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S ntfyDesktop-$pkgver
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
