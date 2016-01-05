# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='dwt'
pkgver='0.6.0'
pkgrel='1'
pkgdesc='Simple no-frills terminal emulator based on VTE'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=( "http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.xz" )
arch=('i686' 'x86_64' 'arm')
depends=('vte3')
options=('strip' 'zipman')
sha512sums=('a124c857e3b216f5d9a3aa873dfbaa6e4ad077230054599e896420f7148d0e5650086ed534f91289e46535b90226066405e3a43f50f032f691adb914bce2ffd6')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CPPFLAGS="${CPPFLAGS} -DDWT_USE_HEADER_BAR=TRUE"
	CPPFLAGS="${CPPFLAGS} -DDWT_USE_POPOVER=TRUE"
	make PREFIX=/usr CPPFLAGS="${CPPFLAGS}"
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
}
