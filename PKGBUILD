# Maintainer: Nicolas <arsenault.nic@gmail.com>
pkgname=sumconfigs
pkgver=0.2.0
pkgrel=1
pkgdesc="Help manage configs, dotfiles and packages"
arch=("any")
url="https://gitlab.com/aurze/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/aurze/$pkgname/-/archive/0.1.0/$pkgname-$pkgver.tar.gz")
b2sums=("ce286773610ffb60de73b602d4579cbd3a172fbfa7f44eee83ad757331159f0dc33c52e6c44d88dce70425c91181668f58045ecc1a7c3aa389ac30896605f91c")

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

