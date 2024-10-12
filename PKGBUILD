# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=teg
pkgver=0.13.0
pkgrel=1
pkgdesc="Tenes Empanadas Graciela (TEG) is a clone of a 'Plan Tactico y Estrategico de la Guerra' board game, a pseudo-clone of Risk, a multiplayer turn-based strategy game."
arch=('x86_64')
url="https://github.com/wfx/teg"
license=('GPL2')
depends=('goocanvas')
makedepends=('docbook-xsl' 'gettext' 'libedit' 'libtool' 'libxml2' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wfx/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d643e0b1b4ebe4baaceb398435517c57a67d7aaaa25dc49880d5f50750b089fc')

build() {
	cd "${pkgname}-${pkgver}"
	sed -i "s|goocanvas-2.0|goocanvas-3.0|g" "./configure.ac"
	./autogen.sh
	CFLAGS="$CFLAGS -fcommon" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
