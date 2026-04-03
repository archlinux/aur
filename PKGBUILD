# Maintainer: Nicolas <arsenault.nic@gmail.com>
pkgname=sumconfigs
pkgver=0.2.3
pkgrel=1
pkgdesc="Help manage configs, dotfiles and packages"
arch=("any")
url="https://gitlab.com/aurze/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/aurze/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=("655a34f9f4622e914a781e2644c783abdc3400e6cfe47de44d815de2676826ed1bfa02bd6cd451814c693d44b9e857ab087c5047b03f916b38100776b5783ab0")

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

