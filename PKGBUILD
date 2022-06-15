# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=2.0.1
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aebaa6ae891022660c555531477776e3b617e591cc19973b442c90964d5080dc')
conflicts=(zeus-bin podman-docker)

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	make BUILD_TYPE=release PREFIX="/usr" build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make BUILD_TYPE=release DESTDIR="$pkgdir" PREFIX="/usr" install
}
