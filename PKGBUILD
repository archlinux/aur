# Maintainer: Nicolas <arsenault.nic@gmail.com>
pkgname=sumconfigs
pkgver=0.1.0
pkgrel=1
pkgdesc="Help manage configs, dotfiles and packages"
arch=("any")
url="https://gitlab.com/aurze/$pkgname"
license=('GPL-3.0-only')
source=("https://gitlab.com/aurze/$pkgname/-/archive/0.1.0/$pkgname-$pkgver.tar.gz")
b2sums=("a213f43cdafb7625338f9d9633170896c794c11bf090b70aa10f451247fcfbdf946be8a692dba64d7e81111fde706d4fba06a6d523dbdd0c4a6e81578a8d9af2")

makedepends=("cargo")

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

