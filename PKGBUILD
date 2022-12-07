# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-clean-all"
pkgname="cargo-clean-all"
pkgver=0.5.0
pkgrel=1
pkgdesc='Recursively clean all cargo projects in a given directory that match the spec...'
url='https://github.com/dnlmlr/cargo-clean-all'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-clean-all/0.5.0/download")
sha512sums=('152752294c66b0498ee6ceff85e82f2f69ceaa6de21a744b57189516b4ed4919711ea82a0817791a412c5adcbc22165faaf590d1e07f4e2a05c74910c1534106')

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
	install -Dm755 "target/release/cargo-clean-all" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}