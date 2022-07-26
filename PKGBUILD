# Maintainer: George Rawlinson <grawlinson@archlinux.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=pulldown-cmark
pkgver=0.9.2
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/raphlinus/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("pulldown-cmark-$pkgver.tar.gz::https://crates.io/api/v1/crates/pulldown-cmark/$pkgver/download")
sha512sums=('2268a3284da5def75b906373a3c70927bc68ecde7b641231d96ff9437785732134568abaf0b6f81c582dc56498da4e677a7b2e2f1914cd42b345db0a06d75c60')
b2sums=('cc8b8cac890b333a864ecb1444128b1aa187392b296c54ccb0c3048d79d17aa7f53bd0ac31f0c6492544ea78636deefaf3ad44804a1c79008e17b27fe1e61fad')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
