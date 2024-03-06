# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=6.0.1
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
  plasma-wayland-session
  qqc2-breeze-style
  kirigami-addons
  maliit-keyboard
  kpipewire
)
optdepends=(
  'plasma-settings: Settings application for Plasma Mobile'
  'plasma-dialer: Phone application'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
  'plasma-mobile-sounds: Plasma Mobile sound theme'
)
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b273882e1c96b4abb9ee7f41227c47a240babfef45909f0dd77cac05ad364008')

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
 
