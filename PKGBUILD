# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="lottie2gif"
pkgname="$_crate"
pkgver=0.2.1
pkgrel=1
pkgdesc='Convert lottie files to GIF'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'rlottie')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('d89e0c921d52e0f26b38d97a2bf9f8a819219158d4af51563b66f0eed60d7f8a1cea04d89794319380c586a1acb440aa78c48d3157f8da4dc4f7b5c3aac35ee9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--features 'clap' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/lottie2gif" -t "$pkgdir/usr/bin"
}
