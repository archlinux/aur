# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=xdg-portal-test-kde-git
pkgver=r139.975b0dc
pkgrel=1
pkgdesc='Test application for Flatpak portals and Qt Flatpak platform plugin'
arch=('x86_64')
url='https://invent.kde.org/libraries/xdg-portal-test-kde'
license=('LGPL-2.1-only')
depends=(
  gcc-libs
  glibc
  gstreamer
  kcoreaddons
  ki18n
  kio
  knotifications
  kwindowsystem
  qt6-base
  qt6-wayland
  xdg-desktop-portal-impl
)
makedepends=(
  extra-cmake-modules
  git
  wayland-protocols
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://invent.kde.org/libraries/xdg-portal-test-kde.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${pkgname%-git}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
