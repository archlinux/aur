# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=cmus-rpc-rs
pkgver=0.2.0
pkgrel=2
epoch=
pkgdesc="A Discord Rich Presence for cmus player using rust 🦀💙"
arch=(x86_64)
url="https://github.com/anas-elgarhy/cmus-rpc-rs"
license=('MIT')
groups=()
depends=(cmus)
makedepends=(cargo)
checkdepends=()
optdepends=()
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

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

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "$pkgdir/usr/bin/" "target/release/$pkgname"
}
sha256sums=('c95ee1e06f0fca3383deeae16aaf2fcd98d2ee3593c4843e2c61e87600ca004f')
