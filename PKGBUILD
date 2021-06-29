# Maintainer: Sematre <sematre at gmx dot de>
pkgname=dvdisaster-unofficial
_pkgver=0.79.6-pl9
pkgver=${_pkgver//-/}
pkgrel=1

pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches (unofficial fork)."
arch=('any')
url="https://github.com/speed47/dvdisaster"
license=('GPL3')
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('b8ccd5f4f43884ec8c506356da3d95cb37ae324965423577e4036b13b5dc8e8b')

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
