# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-bsc-git
_pkgname=osmo-bsc
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.4.0.6.g761fa134a
pkgrel=1
pkgdesc="OsmoBSC is an Open Source BSC (GSM Base Station Controller) with A-bis/IP and A/IP interface."
url="https://osmocom.org/projects/osmobsc"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-sccp' 'osmo-mgw')
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
