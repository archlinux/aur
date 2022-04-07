# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
_crate="trust-dns"
pkgname="$_crate"
pkgver=0.21.2
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
sha512sums=('0c13bdd8261c109e4f88acf3495afe1751e2847bbbdd27f5550f5d79d1078b5c9ffeeb9b43c504491c4f3d6a5eb665b3ae7e30642f97f674f1c396d4ca818fae')

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
