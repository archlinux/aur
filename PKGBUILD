# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=subsurface-libdc-git
_pkgname=libdc
pkgver=20200313.7882ba4
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='https://github.com/Subsurface-divelog/libdc'
license=('LGPL')
arch=('x86_64')
source=('git+https://github.com/subsurface/libdc#branch=Subsurface-NG')
sha256sums=('SKIP')
makedepends=('git')

conflicts=('subsurface-libdc')
provides=('subsurface-libdc')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	autoreconf --install
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
