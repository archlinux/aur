# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-license
pkgver=0.6.0
pkgrel=1
pkgdesc="Cargo subcommand to see license of dependencies"
arch=(x86_64)
url="https://github.com/onur/cargo-license"
license=('MIT')
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/onur/cargo-license/archive/v$pkgver.tar.gz")
sha256sums=('3aa8bf5482aaf83c979ce4f9b5a9f2bd5cf8f71f99ab83c4ce52ed12f804009f')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

check() {
	cd "$pkgname-$pkgver"
	# Test in release mode to avoid recompiling everything
	cargo test --release
}

package() {
	cd "$pkgname-$pkgver"
	install -D -t "$pkgdir/usr/bin" target/release/cargo-license
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
