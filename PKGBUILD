# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-ggsn-git
_pkgname=osmo-ggsn
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.3.0
pkgrel=1
pkgdesc="OsmoGGSN is an Open Source implementation of a GGSN (Gateway GPRS Support Node)."
url="https://osmocom.org/projects/openggsn"
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
