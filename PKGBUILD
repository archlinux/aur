# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage
pkgver=1.4.0
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('50de669324391db18a4b86ea3659a68d733d9fdf144d812ff4bb497501de87683b9af5c4055ad68cbbb948b21b3d596efb8afedba5552937d00079c55a7c7d93')

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
