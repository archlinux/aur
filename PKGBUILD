# Contributor: Kevin Whitaker <eyecreate at gmail dot com>
# Contributor: Adria Arrufat <swiftscythe at gmail dot com>
# Contributor: Logan Allen (loganfynne) <loganfynne at gmail dot com>

pkgname=sumwars
pkgver=0.5.8
pkgrel=1
pkgdesc="Summoning Wars is an open source role-playing game, featuring both a single-player and a multiplayer mode for about 2 to 8 players."
arch=('i686' 'x86_64')
url="http://sumwars.org/"
license=('GPL')
makedepends=('cmake' 'boost')
depends=('ogre' 'cegui' 'physfs' 'freealut' 'enet' 'openal' 'libvorbis' 'boost-libs')
source=(sumwars.desktop "http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}-src.tar.bz2")
md5sums=('6d63a38f2120fc154700317914514278'
         'db2a2a672125668908ffaf8519deae41')
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	# desktop file
	install -Dm755 sumwars.desktop \
		${pkgdir}/usr/share/applications/sumwars.desktop
	# icon
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/share/icon/SumWarsIcon_128x128.png \
		${pkgdir}/usr/share/pixmaps/sumwars.png

	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
