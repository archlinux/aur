# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=aurynk
pkgver=1.3.1
pkgrel=1
pkgdesc="Wirelessly connect, manage and control your Android devices"
arch=('any')
url="https://ishusinghse.github.io/aurynk"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libayatana-appindicator'
  'libnotify'
  'python-gobject'
  'python-pillow'
  'python-pyudev'
  'python-qrcode'
  'python-zeroconf'
  'scrcpy'
  'xdg-utils'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IshuSinghSE/aurynk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ffb00871539bd9b81a667b30e10be3834dc9121abc54235243915138ef0a6a4')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
