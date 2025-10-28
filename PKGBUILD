# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wit-bindgen
pkgver=0.47.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b7de2fcbce039d0fc085b81f2523c4db38ab290e46907985595140361404a3c')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
    	cargo build --frozen --release --all-features
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

