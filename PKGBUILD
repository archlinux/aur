# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-sccp-git
_pkgname=libosmo-sccp
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.0.0
pkgrel=1
pkgdesc="Osmocom SCCP + Sigtran (M3UA, SUA) library"
url="http://openbsc.osmocom.org/trac/wiki/libosmo-sccp"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'lksctp-tools')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install
}
