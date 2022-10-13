# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=bfy
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="brainfuc*k interpreter: a simple brainfuc*k interpreter and REPL writen in rust 🦀🤪"
arch=(x86_64)
url="https://github.com/anas-elgarhy/$pkgname"
license=('MIT')
makedepends=(cargo)
provides=("$pkgname")
conflicts=()
replaces=("$pkgname")
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
	export =stable
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
  sudo install -Dm0755 -t "/usr/bin/" "target/release/$pkgname"
}
sha256sums=('7994e9b500c63e09e5ee47e72b5654c84a2130c968256cebb687fce94ec6c55b')
