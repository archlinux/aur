# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=netboard
pkgdesc="A multiplatform network clipboard sharing service"
url="https://github.com/primalmotion/netboard"
pkgver=1.0.0
pkgrel=1
license=(GPL3)
arch=(x86_64 arm64)
depends=(wl-clipboard)
makedepends=(go)
source=("https://github.com/primalmotion/netboard/archive/v${pkgver}.tar.gz"
netboard.service)
sha256sums=('30c413d7327917a6c71b5bcbfc18c3b5c0dd8886fb2e785838ca62ec26cdc6f5'
            'fe470319810d17f929d983d1f8de2a474bcb9897e1cd1e68a33039c0d50d03e3')
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
