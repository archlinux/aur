# Maintainer: EnokiUN (Enoki) <enokiun@gmail.com>

pkgname='pilfer'
pkgver=0.3.2
pkgrel=1
pkgdesc='A simple TUI frontend for Eludris'
arch=('any')
url='https://github.com/eludris/pilfer'
license=('MIT')
depends=('openssl')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('a2f17312eddabc205f87a6c644697bc642107bd6e535faaeefaff54d1996ec2c932810799517a9f0c1fd95d55aa7cd9b6e4b9e70106a1a4623e8b4a689c21dba')

prepare() {
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
