# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Maintainer: physkets <physkets // at // tutanota dot com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=j4-dmenu-desktop
pkgver=2.18
pkgrel=2
pkgdesc="A much faster replacement for i3-dmenu-desktop. Its purpose is to find .desktop files and offer you a menu to start an application using dmenu."
arch=('any')
url="https://github.com/enkore/j4-dmenu-desktop"
license=('GPL3')
optdepends=('dmenu: install for the default backend'
			'bemenu: an alternative backend')
makedepends=('git' 'cmake')
conflicts=('j4-dmenu-desktop-git')
source=("${pkgname}-r${pkgver}.tar.gz::${url}/archive/r${pkgver}.tar.gz"
		"${pkgname}-r${pkgver}.tar.gz.sig::${url}/releases/download/r${pkgver}/r${pkgver}.tar.gz.sig")
validpgpkeys=('A1774C1B37DC1DCEDB65EE469B8450B91D1362C1') # Marian Beermann <public@enkore.de>
sha256sums=('77c5605d0c1291bcf1e13b186ea3b32ddf4753de0d0e39127b4a7d2098393e25'
			'SKIP')


build() {
	cd ${pkgname}-r${pkgver}
	cmake -D CMAKE_INSTALL_PREFIX=/usr -D WITH_TESTS=OFF .
	make
}

package() {
	cd ${pkgname}-r${pkgver}
	make DESTDIR="$pkgdir/" install
}
