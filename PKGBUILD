# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.4.0
pkgrel=2
epoch=
pkgdesc="A modern PostgreSQL manager TUI"
arch=(x86_64 aarch64)
url="https://github.com/fcoury/tsql"
license=('MIT')
makedepends=(cargo tree-sitter)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
provides=(tsql)
sha256sums=('8a4781f9e268257a08423ef4c2adb25ea996cc29eb5b2ecf1d5a4b91abd93e24')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
 # fix the naitive linking errors 
  export RUSTFLAGS="-Clinker-plugin-lto"
  # export ARGO_PROFILE_RELEASE_LTO=false
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

