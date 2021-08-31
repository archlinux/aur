# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=provok
pkgver=0.1.0
pkgrel=2
pkgdesc="A text renderer written in Rust"
arch=('x86_64')
url="https://github.com/o2sh/provok"
license=('MIT')
depends=('freetype2' 'harfbuzz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f0847ae33691212e05961970498fe03bea09b8f6cbd12148842aae06cc50fbeb')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --release --frozen --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/provok -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
