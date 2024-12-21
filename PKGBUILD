# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage
pkgver=1.7.4
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c8643902fe81a6c77f0058e23bd5c00a590c6f6ac0948838736409ca5f68a065a01d98e22131c1c18cb3f0955e7484af8e2bc25213c5f7600600126562592de6')

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
