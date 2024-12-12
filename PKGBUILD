# Maintainer: Jeff Dickey <releases-usage at jdx dot dev>

pkgname=usage
pkgver=1.5.2
pkgrel=1
pkgdesc='A specification for CLIs'
arch=('x86_64')
url='https://github.com/jdx/usage'
license=('MIT')
makedepends=('cargo')
provides=('usage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdx/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c84821be72e99e0f00420c335a6135b894ee4f7028d4305169d34807193f6dfd53fde698d6a090fb91efd738c7241c337e26b542c58775522a02701a1e010cd6')

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
