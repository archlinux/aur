# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=3.0.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b852285caf19651dd755f851ed2afd883724efa41eec2a9d844fcb20cefc9e0')
conflicts=(zeus-bin)

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	
	./scripts/make_package.sh
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	tar -axvpf zeus.tar.gz -C "$pkgdir"
}
