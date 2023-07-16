# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=bfy
pkgver=0.1.2
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
sha256sums=('82412e7da16ccad263786df57e6c627f83d6cf81ec41857082d553d6631370ab')
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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
