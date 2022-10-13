# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=bfy
pkgver=0.1.0
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
sha256sums=('6cbc8ec926988fee38eae1f43b63c8004b4a8e775bb597b14dd2be1c8ff3a1ab')
