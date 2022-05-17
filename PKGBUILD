# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="b64url"
pkgname="$_crate"
pkgver=0.1.1
pkgrel=1
pkgdesc='Command line URL-safe Base-64 encoder/decoder'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$_crate"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('0c8749474cd23766744f1df72b5a17f20a170e9eac1b3663f91a7e3bf20760f5f36e08bd0fa859edc368cd01d949fd669abd927c109f276c11b801719afad94b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/b64url" -t "$pkgdir/usr/bin"
}
