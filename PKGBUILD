# Maintainer: Meow0x7E <Meow0x7E@outlook.com>
pkgname=slow-scan-print
pkgver=2.0.1
pkgrel=1
pkgdesc='This CLI program prints text at fixed intervals by character or line, and its name was inspired by SSTV (Slow-Scan TV).'
url='https://crates.io/crates/slow-scan-print'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('0cd1bdc4225b5813894d0ad6f10abdca7638dfae2caeb3c1fe7166d7462a7788')
options=('!debug')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

# vim:set sts=4 ts=4 sw=4 noexpandtab:
