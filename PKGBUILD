# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.5.5
pkgrel=3
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=('cargo' 'git')
optdepends=(
	'which: for rules checking executable availability'
)
source=("$pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver")
sha1sums=('8794a271335fa6467de44ff3b5e7651c10809401')
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
