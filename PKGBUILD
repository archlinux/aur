# Maintainer: Sematre <sematre at gmx dot de>
pkgname=dvdisaster-unofficial
_pkgver=0.79.10-pl3
pkgver=${_pkgver//-/.}
pkgrel=1

pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches (unofficial fork)."
arch=('any')
url="https://github.com/speed47/dvdisaster"
license=('GPL3')
depends=('gtk2')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('0a81a5f32be46a1c291fe02ba1e28e409796c744618248cf2ef19446e40ba244')

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
