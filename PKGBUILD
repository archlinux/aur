# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.5.11
pkgrel=1
pkgdesc="Terminal command suggestion, alternative to thefuck written in Rust with AI support"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=('cargo' 'git')
optdepends=()
source=("$pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver")
sha1sums=('e74a582a82eabc807652cd4b9d54e35f2cf8965a')
replaces=('pay_respects')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay-respects" "$pkgdir/usr/bin/pay-respects"
}
