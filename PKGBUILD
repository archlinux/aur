# Maintainer: EnokiUN (Enoki) <enokiun@gmail.com>

pkgname='eludris'
pkgver=0.3.2
pkgrel=1
pkgdesc='A simple CLI to help you with setting up and managing your Eludris instance'
arch=('any')
url='https://github.com/eludris/eludris'
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('3826c8fcbecc9cb41a8799a0d44e8d6306dfefb8aa490575f41d179984a43b31e5252141552a316991ce2d49d45c2d8bc38224b7fa238b3f69b4ba69fdda60bb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
