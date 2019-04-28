# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
pkgname=sync-my-l2p
pkgver=2.4.1
pkgrel=1
pkgdesc="Sync the L2P and moodle instance of RWTH Aachen University"
arch=('x86_64')
url="https://github.com/RobertKrajewski/Sync-my-L2P"
license=('LGPL3')
depends=('hicolor-icon-theme' 'qt5-base')
options=('!strip')
source=("$url/releases/download/v$pkgver/SyncMyL2P-$pkgver-linux.AppImage")
sha256sums=('a84527eadedea94144452f300883eef87880ee0608957dc44094cbd66e6d02c1')

prepare() {
	# Extract binary, desktop entry and icons from the AppImage
	chmod +x SyncMyL2P-$pkgver-linux.AppImage
	for pattern in {usr/bin/Sync-my-L2P,Sync-my-L2P.desktop,hicolor}; do
	  ./SyncMyL2P-$pkgver-linux.AppImage --appimage-extract $pattern > /dev/null
	done
}

package() {
	cd squashfs-root

	# Binary
	install -Dm755 usr/bin/Sync-my-L2P "$pkgdir"/usr/bin/Sync-my-L2P

	# Desktop entry
	install -Dm644 Sync-my-L2P.desktop "$pkgdir"/usr/share/applications/Sync-my-L2P.desktop

	# Icons
	mkdir --parents "$pkgdir"/usr/share/icons && cp --recursive hicolor "$pkgdir"/usr/share/icons/
	chmod --recursive 755 "$pkgdir"/usr/share/icons/hicolor
}
