# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-diet"
pkgname="cargo-diet"
pkgver=1.2.5
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo m...'
url='https://crates.io/crates/cargo-diet'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-diet/1.2.5/download")
sha512sums=('7e9ce0da56efaa26528c024574dc127a1ad7b0da39c2b4bf3d23ae90ed3cb5e54b1a093ebda13aff2eaf0ed0e296d025722cf9eec0ced4c298c6902de1ac2773')

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
	install -Dm755 "target/release/cargo-diet" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}