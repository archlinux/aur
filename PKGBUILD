# Maintainer: Josef Miegl <josef@miegl.cz>

pkgname=libasn1c-git
_pkgname=libasn1c
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.9.31.3.g5e00d6f
pkgrel=1
pkgdesc="runtime library of Lev Walkin's asn1c split out as separate library"
url="http://cgit.osmocom.org/libasn1c/"
arch=('any')
license=(GPL)
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
