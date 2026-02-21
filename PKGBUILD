# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=keepassxc-unlock
pkgver=1.1.0
pkgrel=1
pkgdesc='Passwordless unlocking of KeePassXC after login and screen unlock'
arch=('x86_64')
url="https://github.com/sumwale/${pkgname}"
license=('MIT')
depends=()
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cade15507eb6dc6a62554644bb084ce94b900f5954297d81e95a1575d7f4c168')

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
