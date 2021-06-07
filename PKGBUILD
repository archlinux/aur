# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-doc2readme"
pkgname="$_crate"
pkgver=0.0.4
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from your code'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'curl' 'libgit2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('0b3e93efcc1f5be1d15c280bbea0a98bbdf97f2a3cec644123371a40fbe989d3feb7c3ed87be222b2e37d79096ba2d002ba2c72475bfeff3ddd357b0b9a804f6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
