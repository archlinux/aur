# Maintainer: Grafcube <grafcube at disroot dot org>

pkgname=keepassxc-unlock
pkgver=1.1.1
pkgrel=2
pkgdesc='Passwordless unlocking of KeePassXC after login and screen unlock'
arch=('x86_64')
url="https://github.com/sumwale/${pkgname}"
license=('MIT')
depends=(glib2 readline)
makedepends=(gcc make m4)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33e7c0b6c264b110a9ccb23937879ba0dba3e722b2dbae3bfd33f149a7723bb5')
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
