# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=aurynk
pkgver=1.2.2
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
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IshuSinghSE/aurynk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e273a85b2fcdc2bfe897b0ff53ff47a00792b086cb3d40b94e597a6c7239c349')

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
