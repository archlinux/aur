# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tai
pkgver=0.0.7
pkgrel=1
pkgdesc="terminal ascii image -- convert images to ascii art"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/MustafaSalih1993/tai"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d81767c7f77c6aa473bc6a7fe272494fc93f8f8f08099128034a483d3e5dbb01')

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
	install -Dm 755 target/release/tai -t "$pkgdir/usr/bin/"
	install -Dm 444 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 444 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
