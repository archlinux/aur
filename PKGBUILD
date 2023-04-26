# Maintainer: Firegem <mrfiregem@protonmail.ch>
pkgname=erdtree
pkgver=2.0.0
pkgrel=1
pkgdesc='multi-threaded file-tree visualizer and disk usage analyzer'
arch=('x86_64' 'aarch64')
url='https://github.com/solidiquis/erdtree'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('nerd-fonts: Used for --icons flag')
provides=('erd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9e85f1d92ce4668fa4648348e98aed53fdca4bcbf61c2d5ba53174d459693099')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "${pkgdir}/usr/bin" target/release/erd
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
