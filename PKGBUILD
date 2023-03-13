# Maintainer: Firegem <mrfiregem@protonmail.ch>
pkgname=erdtree
pkgver=1.4.1
pkgrel=1
pkgdesc='multi-threaded file-tree visualizer and disk usage analyzer'
arch=('x86_64' 'aarch64')
url='https://github.com/solidiquis/erdtree'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('nerd-fonts: Used for --icons flag')
provides=('et')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bdabaf2c24c560be2cfd4a980996c885d960309813685bbfdd35be188af3bd39')

prepare() {
	cd "$pkgname-$pkgver"
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
	install -Dm755 -t "${pkgdir}/usr/bin" target/release/et
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
