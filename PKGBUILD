# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=treefetch
pkgver=2.0.0
pkgrel=5
pkgdesc="A plant-based system fetch tool made with Rust"
arch=("x86_64")
url="https://github.com/angelofallars/treefetch"
license=('GPL-3.0-only')
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0ba38c039e510482d11b24e1bdc87e5bedd13d306a0d82e771dc4c298dd585b')

prepare() {
	cd "$srcdir/treefetch-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/treefetch-$pkgver"
	export CARGO_TARGET_DIR=target
	export RUSTUP_TOOLCHAIN=stable
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/treefetch-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/treefetch-$pkgver/target/release"
	install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname"
}
