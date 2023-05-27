# Maintainer: Brigham Campbell <me at brighamcampbell dot com>

pkgname=lazymc
pkgver=0.2.10
pkgrel=1
pkgdesc='Put your Minecraft server to rest when idle.'
url='https://github.com/timvisee/lazymc'
license=('GPL3')
arch=('x86_64')
makedepends=('cargo')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timvisee/lazymc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('367bec1b6de6802f481fd9986c4fcc8851db37396db3306d29ec7d8185ec3c85')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
	install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/target/release/$pkgname"
}
