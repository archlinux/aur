# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-libdc-git
_pkgname=libdc
pkgver=20150826.ad4bcff
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='http://git.subsurface-divelog.org/'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libusb')
makedepends=('git')
source=('git://git.subsurface-divelog.org/libdc#branch=Subsurface-branch')
sha1sums=('SKIP')

conflicts=('subsurface-libdc')
provides=('subsurface-libdc')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf --install
	./configure \
		--prefix=/usr \
		--program-prefix="${_pkgname}-" \

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
