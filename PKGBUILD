# Maintainer: Grafcube <grafcube at disroot dot org>

# TODO: Create package for chipass-unlock (I'll do it whenever I get around to switching)

pkgname=keepassxc-unlock
pkgver=1.2.0
pkgrel=1
pkgdesc='Passwordless unlocking of KeePassXC after login and screen unlock'
arch=('x86_64')
url="https://github.com/sumwale/${pkgname}"
license=('MIT')
depends=(glib2 readline)
makedepends=(gcc make m4)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fe4d8c2e8d3dc103cb3e025ab4f5a167f5575f01f50d67c2915521181ebefb5')
install=keepassxc-unlock.install

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
