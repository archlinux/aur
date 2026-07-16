# Maintainer: Kljunas2 <miha at korenjak dot si>

pkgname=sailcut
pkgver=1.5.1
pkgrel=1
pkgdesc="Software for designing boat sails and developing them into flat panels."
arch=("x86_64")
url="https://www.sailcut.com/"
license=("GPL-2.0-only")
depends=("qt6-base" "qt6-svg" "hicolor-icon-theme")
makedepends=("fig2dev" "qt6-tools")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/sailcut/sailcut/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db63293d38f72795a0a92b0002cbef7d0b0b611f765c4c7bcc1ed6e0144d474b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake6
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "bin/sailcut" -t "${pkgdir}/usr/bin/"
	install -Dm644 share/sailcut/*.qm -t "${pkgdir}/usr/share/sailcut/"
	install -Dm644 "extras/sailcut.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "extras/org.sailcut.cad.metainfo.xml" -t "${pkgdir}/usr/share/metainfo/"
	install -Dm644 "doc/fr/model-sailcut-fr.pdf" -t "${pkgdir}/usr/share/doc/sailcut/"
	install -Dm644 "icons/sailcut.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.sailcut.cad.svg"
	install -Dm644 "icons/sailcut-file.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/application-x-sailcut.svg"
}

post_install() {
	update-desktop-database -q
	gtk-update-icon-cache -q -t
}
