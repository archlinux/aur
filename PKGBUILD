# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

_pkgname=libabigail
pkgname="${_pkgname}-git"
pkgver=1.7.r182.g2f92777d
pkgrel=1
pkgdesc='ABI Generic Analysis and Instrumentation Library'
arch=('i686' 'x86_64')
license=('LGPL3')
url='https://sourceware.org/libabigail/'
makedepends=('git')
depends=('libxml2' 'elfutils' 'python')
source=("${_pkgname}::git://sourceware.org/git/libabigail.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed "s/^${_pkgname}-//;s/-/.r/;s/-/./g"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	autoreconf -fi
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr --with-gnu-ld --enable-bash-completion --enable-cxx11 --disable-static --disable-apidoc --disable-manual
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
