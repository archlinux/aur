# Maintainer: John Ettedgui <git@johne.rojalabs.com>
pkgname=pkgds
pkgver=0.1.0
pkgrel=1
pkgdesc="Real on-disk usage per installed Arch Linux package"
arch=('x86_64' 'aarch64')
url="https://github.com/John-Gee/pkgds"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/John-Gee/pkgds/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('974b3f89a7dfd6cdd52998cefbad0518e2b45d2838cf0d10ddd046a04b40d2f8')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
