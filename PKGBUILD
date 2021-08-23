# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_libname='libgabe'
pkgname="${_libname}-git"
pkgver='r17.700b3c8'
pkgrel=1
pkgdesc='Fork of libbswabe that replaces openssl with libgcrypt and fixes some bugs'
arch=('i686' 'x86_64')
url="https://github.com/schanzen/${_libname}"
depends=('pbc')
license=('GPL2')
conflicts=("${_libname}" "${_libname}-bin")
source=("git+https://github.com/schanzen/${_libname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_libname}" > /dev/null 2>&1
	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_libname}"
	./configure --prefix='/usr'
	make
}

package() {
	cd "${srcdir}/${_libname}"
	make DESTDIR="${pkgdir}" install
	chmod 0644 "${pkgdir}/usr/lib/libgabe.a"
}

