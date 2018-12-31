# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_commit=b16a2c2b5b137f538f0992cd5553c83955257a3a
pkgname=i3status-rust
pkgver=0.9.0
pkgrel=1
pkgdesc='Resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
arch=('x86_64')
url=https://github.com/greshake/i3status-rust
license=('GPL3')
depends=('dbus')
makedepends=('rust')
optdepends=('alsa-utils: for the volume block'
            'lm_sensors: for the temperature block'
            'powerline-fonts: for all themes using the Powerline arrow char'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome: for the Awesome icons')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('0c5d62325d822b87d65e3b1b8c963f2ff0117b63c0bc2c0adc48575344bebbad2ce10b4d9ff308dcab263682123cfa29e6a22610cbd8b9842896bc4ea18a2f53')

build() {
  cd $pkgname-$_commit
  cargo build --release --locked
}

package() {
  cd $pkgname-$_commit
  install -Dt "$pkgdir"/usr/bin target/release/i3status-rs
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname/examples example_*.toml
}

# vim:set ts=2 sw=2 et:
