# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wit-bindgen
pkgver=0.46.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('407fbd9858f84b7179bad3f32e7bf9cf01f1657f263f4ba937e87d9011d54410')

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

