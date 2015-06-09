# Maintainer: Christoph Korn <c_korn@gmx.de>
_pkgname=NetMauMau-Qt-Client
pkgname=nmm-qt-client
pkgver=0.20
pkgrel=1
pkgdesc='Qt client for NetMauMau'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/netmaumau/"
license=('GPL3')
makedepends=('qt4' 'netmaumau-dev' 'espeak')
depends=('qt4' 'espeak' 'libnetmaumauclient3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/velnias75/NetMauMau-Qt-Client/archive/V${pkgver}.tar.gz"
        "widgets.patch")
md5sums=('e9f16b6f2ec4bae8184749f67976abe3'
         '1fb5d46e35c0d51d2aa8a718b3c549fe')

prepare() {
	cd "${_pkgname}-${pkgver}"
	patch -p1 -i ${srcdir}/widgets.patch
}

build() {
	cd "${_pkgname}-${pkgver}"
	lrelease-qt4 ./src/src.pro

	qmake-qt4 CONFIG+=release CONFIG+=espeak ./nmm-qt-client.pro
	make
}

package() {
	cd "${_pkgname}-${pkgver}"

	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/icons/256x256/apps"
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/nmm-qt-client"

	install -Dm0755 src/nmm-qt-client "${pkgdir}/usr/bin/nmm-qt-client"
	install -Dm0644 src/nmm_qt_client.png "${pkgdir}/usr/share/icons/256x256/apps/nmm_qt_client.png"
	install -Dm0644 src/nmm_qt_client.desktop "${pkgdir}/usr/share/applications/nmm_qt_client.desktop"
	install -Dm0644 -t "${pkgdir}/usr/share/nmm-qt-client/" src/*.qm
}
