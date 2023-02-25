# Maintainer: Firegem <mrfiregem@protonmail.ch>
pkgname=erdtree
pkgver=1.1.0
pkgrel=1
pkgdesc='multi-threaded file-tree visualizer and disk usage analyzer'
arch=('x86_64')
url='https://github.com/solidiquis/erdtree'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('et')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88f96e88c493afb021ceda873885a06d30eff9957a1a8736f3b823f8a4703fb0')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "${pkgdir}/usr/bin" target/release/et
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
