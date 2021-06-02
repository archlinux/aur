# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="pdfutil"
pkgname="$_crate"
pkgver=0.4.0
pkgrel=1
pkgdesc='A utility for PDF document manipulation.'
license=('MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="https://github.com/J-F-Liu/lopdf/tree/master/pdfutil"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('c1d3c503e2043cf8b7a4824727ea559b8cc1a201ccd78fd85c640f8e33a5c64199fa7466adfbbee5c730cdb35c6510b3a17a6f484c0174b99d9afb94160dfa68')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/pdfutil" -t "$pkgdir/usr/bin"
}
