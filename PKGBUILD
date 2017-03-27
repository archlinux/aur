# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-source
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=2.0.5
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
md5sums=('7635929c34dd0de37918f1f0b41b3a1e')
sha256sums=('fce2831e93070ab68820143ea6c6a96a625d6e7869d6fa345135185c1c115c44')
