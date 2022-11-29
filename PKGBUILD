# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="next-rust-release-date"
pkgname="next-rust-release-date"
pkgver=0.1.0
pkgrel=1
pkgdesc='When&#x27;&quot;&#x27;&quot;&#x27;s the next Rust release?'
url='https://crates.io/crates/next-rust-release-date'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/next-rust-release-date/0.1.0/download")
sha512sums=('ca65510cbcdd87e2531aeaed970c1ffeed3e898af0809397f0e41f67b94ae3d62a1874298e8d6439d9c9dfceab069ae30241705e5efe38920fa991c7042f2c68')

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
	install -Dm755 "target/release/next-rust-release-date" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}