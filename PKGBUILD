# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="refinery_cli"
pkgname="$_crate"
pkgver=0.6.0
pkgrel=2
pkgdesc='Provides the CLI for the Refinery crate'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('317144130fe44632c15e5ac2bf1ba0d74121c964736aa97dc5ef5a46a53c586acd047a27dc01d97e5ae620f75c0c99e55238ce2e87b2f4546a4110821d80b581')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--no-default-features \
		--features 'postgresql,mysql,sqlite' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
}
