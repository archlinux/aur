# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cork-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line calculator for hex-lovers"
arch=('x86_64')
url="https://github.com/reddocmd/cork"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1e2d957e49d3cc9bb7648aec6f564cff53549ee890d0671a23a50a6ecd3ca422')

prepare() {
	cd "cork-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cd "cork-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable

	cd "cork-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "cork-$pkgver"
	install -Dm 755 target/release/cork -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

