# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus
pkgver=1.2.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('any')
license=('GPL')
depends=('docker')
makedepends=('cargo')
source=("https://github.com/threadexio/zeus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('107d28c9705b6925a80b7b9a6831586fd14429f95eaa24105a57f507db833b0f')
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
