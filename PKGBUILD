# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=1.1.3
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('efd27e6bf00f90581f92f1b80dab9e022811aedb05d5f6d5e23f594217435f09')
conflicts=(zeus-bin podman-docker)

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	make BUILD_TYPE=release build
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	make BUILD_TYPE=release DESTDIR="$pkgdir" PREFIX="/usr" install
}
