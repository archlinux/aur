# Maintainer: Sematre <sematre at gmx dot de>
pkgname=dvdisaster-unofficial
_pkgver=0.79.6-pl8
pkgver=${_pkgver//-/}
pkgrel=1

pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches (unofficial fork)."
arch=('any')
url="https://github.com/speed47/dvdisaster"
license=('GPL3')
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a5c95f0ab2f625ed976a4ef2f6a4736646cccdd7176323dd4743fe8d3618a1d0')

build() {
	cd "${pkgname%-unofficial}-${_pkgver}"
	./configure --prefix=/usr
	make -j$(nproc) && make
}

package() {
	cd "${pkgname%-unofficial}-${_pkgver}"

	make DESTDIR="$pkgdir/" install
	rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"

	install -Dm644 contrib/dvdisaster.desktop -t "${pkgdir}/usr/share/applications"
	install -Dm644 COPYING                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
