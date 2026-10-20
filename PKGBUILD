# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>

pkgname=thesauromatic
pkgver=0.1.0
pkgrel=1
pkgdesc="A static, offline, command-line thesaurus."
arch=('x86_64')
url="https://github.com/cjrh/thesauromatic"
license=('AGPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cjrh/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ce76b2b766b1f15f4002ab89dd44aa55b451f710a10a9794a53d7cf7ee98b94')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/thesauromatic" "$pkgdir/usr/bin/thesauromatic"
}
