# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libsmpp34-git
_pkgname=libsmpp34
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=1.13.0.3.g3cf5229
pkgrel=1
pkgdesc="This is the Osmocom version of libsmpp34, an implementation of the SMPP Protocol v3.4"
url="http://osmocom.org/projects/libsmpp34"
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
