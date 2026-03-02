# Maintainer: Nicolas <arsenault.nic@gmail.com>
pkgname=sumconfigs
pkgver=0.2.1
pkgrel=1
pkgdesc="Help manage configs, dotfiles and packages"
arch=("any")
url="https://gitlab.com/aurze/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/aurze/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("2551ccae037447bcd98af2b6f3508e0b2063a6a1d92892dc4044d11a10334cd9062bdf6aac61e78b478cfc35f851a283e63dbba0be64fdc80ebc04bd475e1773")

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

