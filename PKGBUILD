# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=i3status-rust
pkgver=0.13.1
pkgrel=2
pkgdesc='Resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
arch=('any')
url=https://github.com/greshake/i3status-rust
license=('GPL3')
depends=('dbus' 'libpulse')
makedepends=('rust')
optdepends=('alsa-utils: for the volume block'
            'lm_sensors: for the temperature block'
            'powerline-fonts: for all themes using the Powerline arrow char'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome: for the Awesome icons')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('85c009d9164caac3b209c6afd0d7ad874cf8cea57a6c66c21a9484b186297f02c55cb8fb913db86cd0ccb55cabf14014900043927f9dea768ac7dc5b29a9f787')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/i3status-rs
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/examples example_*.toml
}

# vim:set ts=2 sw=2 et:
