# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-sort"
pkgname="$_crate"
pkgver=1.0.5
pkgrel=1
pkgdesc='Check if tables and items in a .toml file are lexically sorted'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
replaces=('cargo-sort-ck')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('d64690c814bb79ac7767ad1f12a766bc72a45bd247df4433bdae86cb8346cc6ed03f1b97a679a8f4ee8bc06a9b4c7c9c9e6a1f5057ea63df377fc0df02588428')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-sort" -t "$pkgdir/usr/bin"
}
