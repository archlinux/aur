# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=1.1.2
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('373122036f6aa817e4b5b63a9c546b022df516fa13f37e6c233c533d76f96b8d')
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
