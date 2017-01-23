# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-source
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=2.0.4
pkgrel=1
pkgdesc="An advanced ham radio logger using MariaDB - SOURCE version."
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
depends=('xdg-utils'
	 'gtk2'
	 'mariadb')
makedepends=('lazarus')
optdepends=('winkeydaemon: usb cw xmit'
	    'cwdaemon: transmitting cw'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files'
	    'hamlib: rig control'
	    'trustedqsl: upload logs'
	    'hamradio-menus: XDG compliant menuing'
	    'xplanet: gui location'
	    'glabels: print qsl labels')
provides=('cqrlog')
conflicts=('cqrlog' 'cqrlog-git')
source=(https://github.com/${_authorname}/${_pkgname}/archive/v${pkgver}.tar.gz)

prepare() {
	cd "$srcdir/${_pkgname}-$pkgver"

#	sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
	sed -i 's/--ws=gtk2 --pcp=$(tmpdir)\/.lazarus src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 --pcp=$(tmpdir)\/.lazarus src/g' Makefile
	sed -i "s:cqrlog.png:/usr/share/pixmaps/cqrlog/cqrlog.png:" tools/cqrlog.desktop
}

build() {
	cd "$srcdir/${_pkgname}-$pkgver"

	make
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"

	make DESTDIR="$pkgdir/" install
}
md5sums=('38e2a75c6bbebf3f8d13b403c62c256f')
sha256sums=('70aa5b09e281059d7a310ff3c2e4b428ae19e1f7413800fa4d1aaabd2c94f6a0')
