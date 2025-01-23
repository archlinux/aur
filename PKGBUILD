# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=(xcursor-hackneyed-light xcursor-hackneyed-dark)
pkgbase=xcursor-hackneyed
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver=0.9.3
pkgrel=1
url=https://gitlab.com/Enthymeme/hackneyed-x11-cursors/
license=(MIT)
arch=(any)
makedepends=(make jq xorg-xcursorgen 'inkscape>=1.0' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('ed86f0d080b7903fa25bf7270f218e3a3fc09516d8d81542ee04a0da768673bf64cb03c5ba69c7ade905b25b057e9f681e0b1a752941e99b88f088ebaf0bddcd')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"

	# Normal light variant.
	make clean PREFIX=/usr
	make install-all PREFIX=/usr DESTDIR="$(pwd)/_light"

	# Dark variant.
	make clean PREFIX=/usr
	make install-all PREFIX=/usr DARK_THEME=1 DESTDIR="$(pwd)/_dark"
}

package_xcursor-hackneyed-light () {
	replaces=(xcursor-hackneyed)
	conflicts=(xcursor-hackneyed)

	cd "hackneyed-x11-cursors-${pkgver}"
	cp -a _light/* "${pkgdir}"
}

package_xcursor-hackneyed-dark () {
	pkgdesc="${pkgdesc} (dark variant)"

	cd "hackneyed-x11-cursors-${pkgver}"
	cp -a _dark/* "${pkgdir}"
}
