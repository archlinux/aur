# Maintainer: Devin Lin <devin@kde.org>
pkgname=plasma-mobile
pkgver=6.6.2
pkgrel=1
pkgdesc='Plasma Mobile shell components'
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url='https://invent.kde.org/plasma/plasma-mobile'
license=('GPL3')
groups=()
depends=(
  breeze
  breeze-icons
  breeze-cursors
  breeze-gtk
  bluez-qt
  kio
  kpipewire
  kwin
  layer-shell-qt
  milou
  modemmanager-qt
  plasma-keyboard
  plasma-nano
  plasma-nm
  plasma-pa
  plasma-settings
  plasma-workspace
  powerdevil
  qqc2-breeze-style
  qt6-sensors
  xdg-desktop-portal-kde
)
optdepends=(
  'iio-sensor-proxy: IIO accelerometer proxy needed for screen rotation'
  'plasma-camera: The camera app for Plasma'
  'plasma-dialer: Phone application'
  'plasma-mobile-sounds: Plasma Mobile sound theme'
  'plasma-workspace-wallpapers: A large wallpaper selection for Plasma'
)
conflicts=('plasma-mobile-git')
makedepends=(cmake extra-cmake-modules plasma-wayland-protocols)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ed499ed91fdf02f2ba18ad5671e5794af73ac70f72fcb458f9c87acc3f713a2b')

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

  install -Dm644 "${pkgname}-${pkgver}/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
