# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=aurynk
pkgver=1.3.0
pkgrel=1
pkgdesc="Wirelessly connect, manage and control your Android devices"
arch=('any')
url="https://theishu.xyz/aurynk"
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
sha256sums=('604e1331c023482b158d1f8d5e5a327008e3bef404f0087bf1249ec9471a4c8c')

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
