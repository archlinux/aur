# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=i3status-rust
pkgver=0.12.0
pkgrel=2
pkgdesc='Resourcefriendly and feature-rich replacement for i3status, written in pure Rust'
arch=('any')
url=https://github.com/greshake/i3status-rust
license=('GPL3')
depends=('dbus')
makedepends=('rust')
optdepends=('alsa-utils: for the volume block'
            'lm_sensors: for the temperature block'
            'powerline-fonts: for all themes using the Powerline arrow char'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome: for the Awesome icons')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e7d654a9612a8ab66d37022093a5a10e378fa93e4622ac799499643abdeddb29373c4f89318ce5bf6596f46a0522af23f833bcaae99560fe59815a9248e3d5df')

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
