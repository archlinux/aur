# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-pcu-git
_pkgname=osmo-pcu
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.6.0.1.gf0af1b0
pkgrel=1
pkgdesc="OsmoPCU is an Open Source GPRS/EGPRS PCU (Packet Control Unit) with Gb/IP interface."
url="https://osmocom.org/projects/osmopcu"
arch=('any')
license=(GPL)
depends=('libosmocore')
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
