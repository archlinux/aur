# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="lottie2webp"
pkgname="$_crate"
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert lottie files to WEBP'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('1d70c3b19c89b5f8fe19530b31cb57ee7c2baae44716f0e0e85ee8ea255ef167d33118b1a7307cd65f1396092e7b30c5e5836f67684463e3490e67af7b4627e4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--features 'clap' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/lottie2webp" -t "$pkgdir/usr/bin"
}
