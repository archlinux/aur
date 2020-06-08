# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=i3status-rust
pkgver=0.14.1
pkgrel=1
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
sha512sums=('8e254ad75199b3d4f6320c4af09dc82cc8f9528458e8e639f063be6f35d3d266452c1f9aa080101a08df90b46146764c60b09a3a67f7e4c399c603e0b71f2ef9')

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
