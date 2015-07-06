# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-source
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=1.9.0
pkgrel=1
pkgdesc="An advanced ham radio logger using MariaDB - SOURCE version."
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
depends=('xdg-utils'
	 'desktop-file-utils'
	 'gtk2'
	 'mariadb')
makedepends=('lazarus')
optdepends=('winkeydaemon: usb cw xmit'
	    'cwdaemon: transmitting cw'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files'
	    'hamlibs: rig control'
	    'trustedqsl: upload logs'
	    'hamradio-menus: XDG compliant menuing'
	    'xplanet: gui location'
	    'glabels: print qsl labels')
provides=('cqrlog')
conflicts=('cqrlog' 'cqrlog-git')
install=${_pkgname}.install
source=(https://github.com/${_authorname}/${_pkgname}/archive/v${pkgver}.tar.gz)

prepare() {
	cd "$srcdir/${_pkgname}-$pkgver"
	sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
}

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	make
}

package() {
	cd "$srcdir/${_pkgname}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('ad6bbc72b94baafbe0a681c0b86b85d4')
sha256sums=('2f5beef08e109648812e98449ad093a9d6555e3abc72881be2f977e9a1a23850')
