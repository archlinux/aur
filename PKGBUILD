# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bts-git
_pkgname=osmo-bts
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.8.1.205.g5c20563
pkgrel=1
pkgdesc="OsmoBTS is an Open Source GSM BTS (Base Transceiver Station) with A-bis/IP interface."
url="https://osmocom.org/projects/osmobts"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr --enable-trx
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install
}
