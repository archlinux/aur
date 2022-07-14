# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_libname='libgnunetworker'
pkgname="${_libname}-git"
pkgver='r8.80daef5'
pkgrel=1
pkgdesc='Multithreading with GNUnet'
arch=('i686' 'x86_64')
url="https://github.com/madmurphy/${_libname}"
license=('AGPL')
depends=('gettext' 'gnunet')
provides=("${_libname}")
conflicts=("${_libname}" "${_libname}-bin")
source=("git+https://github.com/madmurphy/${_libname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_libname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_libname}"
	./bootstrap --noconfigure
}

build() {
	cd "${srcdir}/${_libname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_libname}"
	make DESTDIR="${pkgdir}" install
}

