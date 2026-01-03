# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.4.0
pkgrel=1
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
sha256sums=('11cad48de8f5d3938502b61c1ea7170c21f3b6e5b3a9d3903e11c5f82375b962')

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

