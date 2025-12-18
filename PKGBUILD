# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.3.1
pkgrel=1
epoch=
pkgdesc="A modern PostgreSQL manager TUI"
arch=(x86_64 aarch64)
url="https://github.com/fcoury/tsql"
license=('MIT')
makedepends=(cargo tree-sitter tree-sitter-json tree-sitter-html)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
provides=(tsql)
sha256sums=('be3d22b060f40126942f524e34961e43f03b9e04bcb7d7cab66890109c9f4473')

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

