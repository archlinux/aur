# Maintainer: Jeff Dickey <releases at usage dot jdx dot dev>

pkgname=usage
pkgver=0.3.0
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0ffbeffb1bbc601358bb6042972127d2254088db28cbd3e037f8a691020c793552dba98934f19aa1a58a76cab2242bd0e01d100fee6d2b66c1462645af3555ea')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin usage
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/usage "$pkgdir/usr/bin/usage"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./target/release/usage --version
}
