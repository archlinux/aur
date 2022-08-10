# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=cranko
pkgver=0.13.0
pkgrel=1
pkgdesc='Cross-platform, cross-language release automation tool'
arch=('x86_64' 'aarch64')
url='https://github.com/pkgw/cranko'
license=('MIT')
depends=('libgit2.so' 'openssl')
makedepends=('cargo')
changelog=CHANGELOG.md
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname@$pkgver.tar.gz")
sha256sums=('3b6c18f13f66d49d078221175489f5af29d73225cdfcd6c9474ad2f28c2e601c')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgname-$pkgver"
	cargo build --frozen --release
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgname-$pkgver"
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
