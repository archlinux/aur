# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libdivecomputer-git
_pkgname=libdivecomputer
pkgver=20150602.e6f51ea
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='http://www.libdivecomputer.org/'
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('git')
source=("${_pkgname}::git://git.code.sf.net/p/libdivecomputer/code")
sha1sums=('SKIP')

provides=('libdivecomputer')
conflicts=('libdivecomputer')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -i
	./configure \
		--prefix=/usr \
		--program-prefix="${_pkgname}-" \

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
