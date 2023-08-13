# Maintainer: Primalmotion <primalmotion at pm dot me>

pkgname=netboard-git
pkgdesc="A multiplatform network clipboard sharing service"
url="https://github.com/primalmotion/netboard"
pkgver=0.0.1
pkgrel=1
license=(GPL3)
arch=(x86_64 arm64)
depends=(wl-clipboard)
makedepends=(go)
source=("${pkgname}::git+https://github.com/primalmotion/netboard"
netboard.service)
sha256sums=('SKIP'
            'fe470319810d17f929d983d1f8de2a474bcb9897e1cd1e68a33039c0d50d03e3')
provides=("netboard")
conflicts=(netboard)

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/lib/systemd/user"
	install -m 644 ../netboard.service "${pkgdir}/usr/lib/systemd/user"
	PREFIX=${pkgdir}/usr make install
}
