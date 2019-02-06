# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=osmo-msc-git
_pkgname=osmo-msc
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.3.1.7.gc7de62cc
pkgrel=1
pkgdesc="New (2017) Osmocom Mobile Switching Center (MSC)."
url="https://osmocom.org/projects/osmomsc/"
arch=('any')
license=(GPL)
depends=('libosmocore' 'libosmo-abis' 'libosmo-netif' 'libosmo-sccp' 'osmo-mgw' 'osmo-iuh' 'libsmpp34' 'libasn1c' 'libdbi' 'libdbi-drivers' 'openssl')
source=("git://git.osmocom.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure --prefix=/usr --enable-iu --enable-smpp
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=${pkgdir} install
}
