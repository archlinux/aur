# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="mkvdump"
pkgname="mkvdump"
pkgver=0.6.0
pkgrel=1
pkgdesc='MKV and WebM parser CLI tool'
url='https://crates.io/crates/mkvdump'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/mkvdump/0.6.0/download")
sha512sums=('673ce66aaa01d00d19919818e05514f4342fbefb161decbb6335a8c9ea7518ecf54056fff7a414f2e52c827ec4410af668241584d4b482f84378b0f022f544cc')

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
	install -Dm755 "target/release/mkvdump" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}