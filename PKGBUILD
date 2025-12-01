# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=aurynk
pkgver=1.1.0
pkgrel=2
pkgdesc="Wirelessly connect, manage and control your Android devices"
arch=('any')
url="https://github.com/IshuSinghSE/aurynk"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libayatana-appindicator'
  'libnotify'
  'python-gobject'
  'python-pillow'
  'python-qrcode'
  'python-zeroconf'
  'scrcpy'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bea18d528804746ca42d7ef0923a4b18155332cb85053f7b19b69c7c74d7dbaa')

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
