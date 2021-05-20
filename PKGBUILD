# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="cargo-doc2readme"
pkgname="$_crate"
pkgver=0.0.2
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from your code'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('7a794520c88dadc537093bc39c9368e9c7444d2e01b1c90b0f4fb9ad1486271af94b90a79d758c5371e0f1f2c4fe684d030452d777303b61b28e4991cc4fccf6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
}
