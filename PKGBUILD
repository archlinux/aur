# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=6.6.1
pkgrel=1
pkgdesc="Plasma Mobile shell components."
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://invent.kde.org/plasma/plasma-mobile"
license=('GPL3')
groups=()
depends=(
  plasma-nano
  plasma-nm
  plasma-pa
  bluez-qt
  powerdevil
  modemmanager-qt
  qqc2-breeze-style
  kirigami-addons
  kpipewire
  plasma-settings
  kwin
  plasma-keyboard
  qt6-sensors
)
optdepends=(
  'plasma-dialer: Phone application'
  'plasma-login-manager: Official login manage for Plasma'
  'plasma-mobile-sounds: Plasma Mobile sound theme'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
)
conflicts=('plasma-mobile-git')
makedepends=(cmake extra-cmake-modules plasma-wayland-protocols)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('2a500af0329758fed74afc1b1393a7290a7b3747c39e6401aa03286ba2805b4c')

prepare() {
  mkdir -p build
}

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
