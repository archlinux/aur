# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-hlr-git
_pkgname=osmo-hlr
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.0.0.5.g02078b7
pkgrel=1
pkgdesc="The Osmocom Home Location Register (OsmoHLR) is the subscriber database and authentication key store of an Osmocom 2G/3G network."
url="https://osmocom.org/projects/osmo-hlr"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'sqlite' 'libdbi' 'libdbi-drivers')
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
