# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal command suggestion, alternative to thefuck written in Rust with AI support (All modules)"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=('cargo' 'git')
optdepends=(
	'curl: for AI suggestions'
)
source=("$pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver")
sha1sums=('152f05d9f7a816d5e200b390434e90377f92f8b9')
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
	install -Dm755 "target/release/_pay-respects-module-runtime-rules" "$pkgdir/usr/bin/_pay-respects-module-runtime-rules"
	install -Dm755 "target/release/_pay-respects-fallback-request-ai" "$pkgdir/usr/bin/_pay-respects-fallback-request-ai"
}
