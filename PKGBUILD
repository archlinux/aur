# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="ripdrag"
pkgver="0.3.2"
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=(x86_64)
url="https://github.com/nik012003/ripdrag"
license=('GPL3')
depends=('gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('569f96b2fb5d071f207884d2b9b184b100dd0f964c7e338249533e813e860cc0')

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
