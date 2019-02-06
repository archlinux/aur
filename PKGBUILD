# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libosmo-netif-git
_pkgname=libosmo-netif
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.4.0.5.ga720365
pkgrel=1
pkgdesc="This is a network interfacing library intended to abstract all kinds of signalling + user payload interfaces, including Abis/IP (IPA), A/IP (SCCPlite), as well as the Osmux protocol"
url="http://osmocom.org/projects/libosmo-netif"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'lksctp-tools' 'ortp')
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
