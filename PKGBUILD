# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=keepassxc-unlock
pkgver=1.1.2
pkgrel=1
pkgdesc='Passwordless unlocking of KeePassXC after login and screen unlock'
arch=('x86_64')
url="https://github.com/sumwale/${pkgname}"
license=('MIT')
depends=(glib2 readline)
makedepends=(gcc make m4)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('15288afe3a946c6876a7e210bf4f5c286b0d94f621147434cbc2db4f1540ceb1')
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
