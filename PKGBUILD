# Author: Adrian Perez de Castro <aperez@igalia.com>
pkgname='signify'
pkgver='22'
pkgrel='1'
pkgdesc='OpenBSD tool to signs and verify signatures on files. Portable version.'
url='https://github.com/aperezdc/signify'
license=('custom:BSD')
arch=('i686' 'x86_64' 'arm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/${pkgname}/archive/v${pkgver}.tar.gz" LICENSE)
sha512sums=('a8ddbb032dd95fbec2d032a155b90a9f93d109122f707dace219007c2d89e2ed1cfc33e7b32c542cbaa182ca5015bb33a93a814ea960628d209addc84eddfbb2'
            'a587ef19d5481a81945475a2c1dde0fbf8022e0a28db06389c73df1b7118fb94399f5e4523b91df3d846707dcaffff482ae6e58902b6620bf7b2019a8e15efec')
depends=('libbsd>=0.8')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' LTO=1 EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}" GIT_TAG=''
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX='/usr' DESTDIR="${pkgdir}" GIT_TAG='' install
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
