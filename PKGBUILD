# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=keepassxc-unlock
pkgver=1.0.9
pkgrel=1
pkgdesc='Passwordless unlocking of KeePassXC after login and screen unlock'
arch=('x86_64')
url="https://github.com/sumwale/${pkgname}"
license=('MIT')
depends=()
makedepends=()
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3b98c6c3ec5a698d30829e0adacd6cfd7181fbcc005d4d3712087651b93614eb')

build() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build/pkg/usr/{bin,lib/systemd/system}
	make \
		PKG_INSTALL=true \
		INSTALL_ROOT="$(realpath ./build/pkg)" \
		INSTALL_BIN_DIR=/usr/bin \
		INSTALL_SERVICE_DIR=/usr/lib/systemd/system \
		install
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -ar ./build/pkg/usr -t "${pkgdir}"
}
