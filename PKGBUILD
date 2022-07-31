# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-git
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=2.5.2.r234.g98a8ba5
#.r234.g98a8ba5
#.r208.g823332c
pkgrel=1
pkgdesc="An advanced ham radio logger using MariaDB - GIT version."
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
depends=('xdg-utils' 'gtk2' 'mariadb' 'hamlib' 'hamradio-menus')
makedepends=('lazarus' 'git')
optdepends=('winkeydaemon: usb cw xmit'
	    'cwdaemon: transmitting cw'
	    'fldigi: RTTY and Digital modes'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files'
	    'trustedqsl: upload logs'
	    'xplanet: gui location'
	    'glabels: print qsl labels')
provides=('cqrlog')
conflicts=('cqrlog' 'cqrlog-source' 'cqrlog-bin')
source=("${_pkgname}::git+https://github.com/${_authorname}/${_pkgname}.git#branch=master")

pkgver() {
	cd "${_pkgname}"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "$srcdir/$_pkgname"

#	sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
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
