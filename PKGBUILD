# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=nostui
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI client for Nostr"
arch=('x86_64' 'aarch64')
url="https://github.com/akiomik/nostui"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bf7c4de3ec01a75943e6de1c6c4048de56368d504eb4ad63785def4da54a1ee')

prepare() {
	cd "nostui-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "nostui-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "nostui-$pkgver"
	install -Dm755 "target/release/nostui" "$pkgdir/usr/bin/nostui"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
