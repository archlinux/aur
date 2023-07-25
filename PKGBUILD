# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="ripdrag"
pkgver="0.3.1"
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=(x86_64)
url="https://github.com/nik012003/ripdrag"
license=('GPL3')
depends=('gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7142cd872e282acd972045623efd0b949d039004897132ce58aaa01c45ba5b4b')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen
}

check() {
	cd "$pkgname-$pkgver"
	./target/release/ripdrag -V
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/ripdrag" "$pkgdir/usr/bin/ripdrag"
}
