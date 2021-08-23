# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-git
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=2.5.2.r58.g5dd6ea9
#.r1.g7ffd237
pkgrel=1
pkgdesc="An advanced ham radio logger using MariaDB - GIT version."
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
depends=('xdg-utils' 'gtk2' 'mariadb')
makedepends=('lazarus' 'git')
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
conflicts=('cqrlog' 'cqrlog-source' 'cqrlog-bin')
source=("${_pkgname}::git://github.com/${_authorname}/${_pkgname}.git#branch=master")

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "$srcdir/$_pkgname"

	sed -i 's/--ws=gtk2 --pcp=$(tmpdir)\/.lazarus src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 --pcp=$(tmpdir)\/.lazarus src/g' Makefile
	sed -i "s:cqrlog.png:/usr/share/pixmaps/cqrlog/cqrlog.png:" tools/cqrlog.desktop
}

build() {
	cd "$srcdir/$_pkgname"

	make
}

package() {
	cd "$srcdir/$_pkgname"

	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
