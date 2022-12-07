# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="ldproxy"
pkgname="ldproxy"
pkgver=0.3.3
pkgrel=1
pkgdesc='A linker proxy tool'
url='https://crates.io/crates/ldproxy'
license=('Apache' 'MIT')

depends=('gcc-libs' 'clang')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/ldproxy/0.3.3/download")
sha512sums=('5e3e6a4f04a3e79e92864d8e12fe0a569dc5579db1c4619032dfd5a3adf1b6a5b6f7c794f9adfa8c188d737376d262502e6f596d79ce9333437d0783abab104e')

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
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}