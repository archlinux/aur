# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>
pkgname=cqrlogalpha-git
_pkgname=CqrlogAlpha
_authorname=OH1KH
pkgver=136.r0.gd0130fd
pkgrel=1
pkgdesc="CqrlogAlpha is a Cqrlog (by OK2CQR&OK1RR) clone that is under development"
arch=('x86_64')
url="https://github.com/OH1KH/CqrlogAlpha"
license=('GPL-3.0-only')
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
conflicts=('cqrlog' 'cqrlog-git' 'cqrlog-source' 'cqrlog-bin')
options=(!debug)
source=("git+https://github.com/${_authorname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed -E 's/^.*\(([0-9]+)\)_-(.*)$/\1.r\2/' | sed 's/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/usr" install
}
