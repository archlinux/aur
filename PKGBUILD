# Maintainer: Chris <goabonga@pm.me>

pkgname=hotkeys-gpd
pkgver=0.1.0
pkgrel=1
pkgdesc='Hotkey daemon for the GPD Pocket: backlight, volume and mute keys (evdev + ALSA, no desktop needed)'
arch=('x86_64')
url='https://github.com/goabonga/hotkeys-gpd'
license=('MIT')
depends=('libevdev'
         'alsa-lib')
makedepends=('pkgconf')
optdepends=('gpd-pocket-mixer: persistence of the volume through pocket-mixer-state.service')
backup=('etc/gpd-hotkeysd.conf')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7eea739dd8e7a424f224e82580fce88bcac818c3f9b0d7e5f749befb24489a9f')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  # the sanitizers are a development option of upstream
  make SANITIZE= test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
