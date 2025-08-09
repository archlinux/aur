# Maintainer: xotkot
pkgname=refold
pkgver=0.1.2
pkgrel=2
pkgdesc="A command-line utility for wrapping text"
arch=('x86_64' 'aarch64')
url="https://github.com/wr7/refold"
license=('GPL-2.0-or-later')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('dad3cb57e370d562fa8c08749f2e8660288a2ca0233c9db514162946c1f2e4ab96e45402074cdf2068b3b9b4d095df4ead82be2c2e1190e1be543762d26d5f20')

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

check() {
	cd "$pkgname-$pkgver"
	
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
