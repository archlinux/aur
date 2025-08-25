# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=6.4.4
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
  maliit-keyboard
  kpipewire
  plasma-settings
  kwin
)
optdepends=(
  'plasma-dialer: Phone application'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
  'plasma-mobile-sounds: Plasma Mobile sound theme'
)
conflicts=('plasma-mobile-git')
makedepends=(cmake extra-cmake-modules)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('8481ca63a93575fa443248be0b86e0536f4452538479cddfa6cf958e0f9112f1')

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
 
