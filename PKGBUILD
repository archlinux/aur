# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="crab-hole"
pkgname="crab-hole"
pkgver=0.1.2
pkgrel=1
pkgdesc='Pi-Hole clone written in rust using trust-dns '
url='https://crates.io/crates/crab-hole'
license=('AGPL')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/crab-hole/0.1.2/download")
sha512sums=('aba6199284ce435b34ea5c618a5101bd9a542d979f43283502946eff0867be22489499ae70ef9f5be1541f7ad647fef53f7c34db445bc4e745b607a1f2af70a9')

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
	install -Dm755 "target/release/crab-hole" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}