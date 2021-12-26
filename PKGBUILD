# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=todo
pkgver=2.4
pkgrel=1
pkgdesc='Simple tasks organizer'
arch=('x86_64')
url='https://github.com/sioodmy/todo'
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3905909de5dd6e3a849505c5c97264a9b6d83cdd8e171a319233e68142162656')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -D "target/release/todo-bin" "$pkgdir/usr/bin/todo"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
