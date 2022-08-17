# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="ldproxy"
pkgname="ldproxy"
pkgver=0.3.2
pkgrel=1
pkgdesc='A linker proxy tool'
url='https://crates.io/crates/ldproxy'
license=('Apache' 'MIT')

depends=('gcc-libs' 'clang')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/ldproxy/0.3.2/download")
sha512sums=('19e3eed00724edad93282f9dbcf6ead7467fe4585d2c04c46be33b67ac71088076d8fd7c0d394d044649a8a975ad55e0191ca6758ab3b4d72b7b3db02f92cf74')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/ldproxy" -t "$pkgdir/usr/bin"
}