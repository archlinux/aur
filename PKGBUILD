# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="sqlx-cli"
pkgname="$_crate"
pkgver=0.5.5
pkgrel=1
pkgdesc='Command-line utility for SQLx, the Rust SQL toolkit.'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://github.com/launchbadge/sqlx"
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('9f43a2ca83601c8c73502deb71bae8701e0cfc385038da806f2cd454b70e01d290f99b2761df6ab56f81396abf3a2b177ca0fe547b6c5ae25aa83ed4db29efff')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-sqlx" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/sqlx" -t "$pkgdir/usr/bin"
}
