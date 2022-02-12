# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="trust-dns"
pkgname="$_crate"
pkgver=0.20.4
pkgrel=1
pkgdesc='Trust-DNS is a safe and secure DNS server with DNSec support. Eventually this...'
license=('Apache' 'MIT')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url="http://www.trust-dns.org/index.html"
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('bind')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_crate/$pkgver/download")
sha512sums=('873e5632e3c6fa2e2c7f344c3b7c1e57a3d962cfc95d6ec42d84e6a9f38e385efbc91c01bf3ef3e18138a656ea4cbf0d23320123a6315bd08c3443d2b8443af8')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build \
		--locked \
		--features 'dns-over-tls,dns-over-https-rustls' \
		--release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "target/release/named" -t "$pkgdir/usr/bin"
}
