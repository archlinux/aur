# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.6.2
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=('cargo' 'git')
optdepends=(
	'curl: for AI suggestions'
)
source=("$pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver")
sha1sums=('3078dce1e41fb4455c62523fdb0e60b90214ded7')

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
	install -Dm755 "target/release/_pay-respects-module-100-runtime-rules" "$pkgdir/usr/bin/_pay-respects-module-100-runtime-rules"
	install -Dm755 "target/release/_pay-respects-fallback-100-request-ai" "$pkgdir/usr/bin/_pay-respects-fallback-100-request-ai"
}
