# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=treefetch
pkgver=2.0.0
pkgrel=2
pkgdesc="A plant-based system fetch tool made with Rust"
arch=("x86_64")
url="https://github.com/angelofallars/treefetch"
license=('GPL3')
depends=("gcc-libs" "glibc")
makedepends=("rust" "cargo")
changelog=
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/treefetch"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/treefetch"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/treefetch"
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/treefetch/target/release"
	install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname"
}
