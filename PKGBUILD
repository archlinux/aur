# Maintainer: Nicolas <arsenault.nic@gmail.com>
pkgname=sumconfigs
pkgver=0.2.2
pkgrel=1
pkgdesc="Help manage configs, dotfiles and packages"
arch=("any")
url="https://gitlab.com/aurze/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/aurze/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("792dbf3d40bfd6f8fe5fd0ae1d60faef50fcb717eb12ac5de466ec0eaf49da1302910cf1efd34959230b930e7ed68443bd9c5c573c241cec3ea023e3334328a0")

makedepends=("cargo")

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname-$pkgver/target/release/$pkgname"
}

