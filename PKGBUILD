# Maintainer: Kljunas2 <miha at korenjak dot si>

pkgname=sailcut
pkgver=1.5.1
pkgrel=1
pkgdesc="Software for designing boat sails and developing them into flat panels."
arch=("x86_64")
url="https://www.sailcut.com/"
license=("GPL-2.0-only")
depends=("qt6-base" "qt6-svg" "hicolor-icon-theme")
makedepends=("fig2dev" "qt6-tools" "docbook-xsl")
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/sailcut/sailcut/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db63293d38f72795a0a92b0002cbef7d0b0b611f765c4c7bcc1ed6e0144d474b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake6
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}/usr" install
}

post_install() {
	update-desktop-database -q
	gtk-update-icon-cache -q -t
}
