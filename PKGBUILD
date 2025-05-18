# Maintainer: Sematre <sematre at gmx dot de>
pkgname=dvdisaster-unofficial
_pkgver=0.79.10-pl5
pkgver=${_pkgver//-/.}
pkgrel=1

pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches (unofficial fork)."
arch=('any')
url="https://github.com/speed47/dvdisaster"
license=('GPL3')
depends=('gtk2')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('e7101b62758f659c50f43d33f44ed08ba24dfecb60e5e31fb541a592bc39d670')

build() {
	cd "${pkgname%-unofficial}-${_pkgver}"

	./configure --prefix=/usr
	make -j$(nproc)
}

package() {
	cd "${pkgname%-unofficial}-${_pkgver}"

	make DESTDIR="${pkgdir}/" install
	rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"

	install -Dm644 contrib/dvdisaster.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm644 COPYING                    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
