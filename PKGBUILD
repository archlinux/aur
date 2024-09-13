# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>

pkgname=wit-bindgen
pkgver=0.32.0
pkgrel=1
pkgdesc="A language binding generator for WebAssembly interface types"
arch=("x86_64")
url="https://github.com/bytecodealliance/wit-bindgen"
license=("Apache-2.0")
depends=("glibc" "gcc-libs")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f0edea6ecb7266368ab063d7c935e48e8b4077b9c805ee82b325d210b26653a0")

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

