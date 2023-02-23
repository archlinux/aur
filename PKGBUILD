# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=5.27.1
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
  powerdevil
  modemmanager-qt
  plasma-wayland-session
  qqc2-breeze-style
  qt5-feedback
  kirigami-addons
  maliit-keyboard
  kpipewire
)
optdepends=(
  'plasma-mobile-nm: Mobile networking settings modules for WiFi, etc.'
  'plasma-settings: Settings application for Plasma Mobile'
  'plasma-dialer: Phone application'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
  'plasma-mobile-sounds: Plasma Mobile sound theme'
)
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('c93a644daac49b5b59dd434a252cd7f600b9cbb88eec5f25a0f96d5dded33701')

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
 
