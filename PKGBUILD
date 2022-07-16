# Maintainer: crapStone <crapstone01@gmail.com>

pkgname=lamp
pkgver=0.3.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A Linux backlight utility inspired by acpibacklight"
url="https://codeberg.org/crapStone/lamp"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbf2ea683d3789f1b02d527dcf9c128a3c3f74bec98c575ce2b7180c4b2168f2')

prepare() {
	cd "$pkgname"

	cargo fetch --locked
}

build() {
	cd "$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package () {
	cd "$pkgname"

	install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
