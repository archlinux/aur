# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-doc2readme"
pkgname="$_crate"
pkgver=0.0.6
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
sha512sums=('9403b453b4f327c43f8f0dbaeb95e0c494855316ff2da7a7270653d46da9fcff90bf5008cf70815fef17c77debb811c8ee5b301989c76ce8a1a872bc8eb376fa')

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
