# Maintainer: TTsdzb <ttsdzboutlook dot com>
# Maintainer: Jia Yin<lok-ation at outlook dot com>

pkgname=uni-updater
pkgver=0.2.3
pkgrel=1
pkgdesc='Helper program that updates everything on your system.'
arch=('x86_64')
url="https://codeberg.org/TTsdzb/uni-updater"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('uni-updater')
provides=("uni-updater=${pkgver}")
source=("$pkgname::git+$url#tag=4f7005e82c")
sha512sums=('e98eb54baf7d6abbdf1e9bdefea3354bc722f18b813cd646f9de95f84c770a344611fae1618c62ecd212902d9b5ef3e6040fb19c1c0db076901663c7f619c3b8')
prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" target/release/uni-updater
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
