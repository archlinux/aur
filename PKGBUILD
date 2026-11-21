# Maintainer: pantarune <pantarune@users.noreply.github.com>
pkgname=niri-settings-app
pkgver=0.1.0
pkgrel=1
pkgdesc='Safe graphical settings app for the niri compositor'
arch=('x86_64')
url='https://github.com/pantarune/niri-settings'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'niri')
makedepends=('cargo' 'pkgconf')
checkdepends=('dbus')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a73985e32193122f8c7bbc3383ed06e6e5cea6e7ec2be54561420338c1abf6f5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/niri-settings-app "$pkgdir/usr/bin/niri-settings-app"
  install -Dm755 target/release/niri-settings-cli "$pkgdir/usr/bin/niri-settings-cli"
  install -Dm755 target/release/niri-settings-daemon "$pkgdir/usr/bin/niri-settings-daemon"
  install -Dm644 data/io.github.niri_settings.NiriSettings.desktop \
    "$pkgdir/usr/share/applications/io.github.niri_settings.NiriSettings.desktop"
  install -Dm644 data/io.github.niri_settings.NiriSettings.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.niri_settings.NiriSettings.metainfo.xml"
  install -Dm644 data/io.github.niri_settings.NiriSettings.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.niri_settings.NiriSettings.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
