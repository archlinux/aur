pkgname='dwt'
pkgver='0.5.1'
pkgrel='3'
pkgdesc='Simple no-frills terminal emulator based on VTE'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=( "http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.xz" )
sha1sums=('120c61e790c269711854b8ef9fc360945af764e5')
arch=('i686' 'x86_64' 'arm')
depends=('vte290')
options=('strip' 'zipman')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CPPFLAGS="${CPPFLAGS} -DDWT_USE_HEADER_BAR=TRUE"
	CPPFLAGS="${CPPFLAGS} -DDWT_USE_POPOVER=TRUE"
	make PREFIX=/usr CPPFLAGS="${CPPFLAGS}"
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	chmod 2755 "${pkgdir}/usr/man" "${pkgdir}/usr/man/man1"
}
