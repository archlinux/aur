# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_commit=v0.10.0
pkgname=i3status-rust
pkgver=0.10.0
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
sha512sums=('2d13ed29dcf94d8dcaeaee03e3c2eb782d1edae28814acbdf0677ee28bece64f6e05b56269641405229fa2ec3c22be076622bd62eec5886967e844b113a9adf5')

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
