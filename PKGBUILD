# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-abis-git
_pkgname=libosmo-abis
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.6.0.1.g480073a
pkgrel=1
pkgdesc="This is the A-bis interface library as used by OsmoBSC/OsmoNITB"
url="https://osmocom.org/projects/libosmo-abis"
arch=('any')
license=(GPL)
depends=('libosmocore' 'ortp')
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
