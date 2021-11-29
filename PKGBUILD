# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='gnunet'
_module='libgnunetchat'

pkgname="${_module}-git"
pkgver='r34.1edfdc7'
pkgrel=1
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${_module}" "${_module}-bin")
provides=("${_module}")
depends=("${_framework}")
options=('!makeflags' '!buildflags')
source=("git+https://git.${_framework}.org/${_module}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_module}"
	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}


build() {
	cd "${srcdir}/${_module}"
	make
}

package() {
	cd "${srcdir}/${_module}"
	install -dm755 "${pkgdir}/usr"
	install -dm755 "${pkgdir}/lib"
	install -dm755 "${pkgdir}/include/gnunet"
	make INSTALL_DIR="${pkgdir}/" install
	mv "${pkgdir}/include" "${pkgdir}/usr"
	mv "${pkgdir}/lib" "${pkgdir}/usr"
}
