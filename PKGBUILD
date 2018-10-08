# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='libconfini-git'
_pkgname='libconfini'
pkgver='r120.8c5ca5a'
pkgrel=1
pkgdesc='Yet another INI parser'
arch=('i686' 'x86_64')
url='https://madmurphy.github.io/libconfini/'
license=('GPL')
provides=('libconfini')
conflicts=('libconfini')
source=("git+https://github.com/madmurphy/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {

	cd "${_pkgname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr CFLAGS='-pedantic -std=c99 -g -O3'

}

build() {

	cd "${srcdir}/${_pkgname}"
	make

}

check() {

	cd "${srcdir}/${_pkgname}"
	make check

}

package() {

	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install

}

