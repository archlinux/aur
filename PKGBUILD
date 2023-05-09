# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=netboard
pkgdesc="A multiplatform network clipboard sharing service"
url="https://github.com/primalmotion/netboard"
pkgver=0.0.1
pkgrel=1
license=(GPL3)
arch=(x86_64 arm64)
depends=(wl-clipboard)
makedepends=(go)
source=("https://github.com/primalmotion/netboard/archive/v${pkgver}.tar.gz"
netboard.service)
sha256sums=('534e85d0f42eea2aea901c2ffb4b030655f7db2d21f96664401495393a6b7767'
            '7df348b72086d29366fc24cd75aca6d8565edbaabe7790e3acbc09631c28980b')
provides=("netboard")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/lib/systemd/user"
	install ../netboard.service "${pkgdir}/usr/lib/systemd/user"
	PREFIX=${pkgdir}/usr make install
}
