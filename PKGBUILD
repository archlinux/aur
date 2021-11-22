# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=starlark-rust
_pkgname=starlark
pkgver=0.6.0
pkgrel=1
pkgdesc="Rust implementation of the Starlark language"
arch=('x86_64')
url="https://github.com/facebookexperimental/starlark-rust"
license=('Apache')
depends=('gcc-libs')
makedepends=('rustup')
provides=('starlark')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebookexperimental/starlark-rust/archive/v$pkgver.tar.gz")
sha512sums=('2d1a2e21175728ece8b03fb653b3998d886a2c3cfbb27ca72238bcf8aeab649cba188854ab3d94b8222fe349be06722178dc352d456ef1c9ca5b0f3bc2df7707')
b2sums=('19dd602bca3df0fba75de53dc59371286f94f2a7bbaa2b591673e56bb13ddd2979fbc3be89694ab84ef283f1e62246a5d2bdcd848cb430b7fa79b7cedb6b0f96')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/starlark

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
