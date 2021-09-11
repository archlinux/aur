# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=cargo-license
pkgver=0.4.2
pkgrel=1
pkgdesc="Cargo subcommand to see license of dependencies"
arch=(x86_64)
url="https://github.com/onur/cargo-license"
license=('MIT')
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/onur/cargo-license/archive/v$pkgver.tar.gz")
sha256sums=('991d0d0cf1bf21b0a6fe1bc354bf876986477b06037be2a4718c5afce1a08925')

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
