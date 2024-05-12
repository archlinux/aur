# Maintainer: Jeff Dickey <releases at usage dot jdx dot dev>

pkgname=usage
pkgver=0.1.18
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('90dcdc44ef8535474d8cba8a0faac13e939070197b75fac6b10c83f51a390bcb652f9faf24ef5fe7f05a64446a64cfbcdfd3b574ce3cdb29460cfa4d146acc70')

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
