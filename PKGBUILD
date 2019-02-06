# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-iuh-git
_pkgname=osmo-iuh
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.4.0.1.g04b5b66
pkgrel=1
pkgdesc="An Open Source implenentation of a HNB-GW (HomeNodeB-Gateway), implementing the Iuh, IuCS and IuPS interfaces."
url="http://osmocom.org/projects/osmohnbgw"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-netif' 'libosmo-sccp' 'libasn1c' 'lksctp-tools')
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
