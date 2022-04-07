# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="lottie2webp"
pkgname="$_crate"
pkgver=0.2.0
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
sha512sums=('bce4e6ce9dfcd1a8e6566863c575ea15ef906cb94108caaecfa53b44968a77de9ca4bf0ec135de9c0443b7299e371858323fb5ef38ccc11c5803b53590bc63f8')

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
