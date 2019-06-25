# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_mainapp='gnunet'
_extname='groupchat'
_appname="${_mainapp}-${_extname}"
pkgname="${_appname}-git"
pkgver='r25.811ca95'
pkgrel=1
pkgdesc="A simple client-server chat system, using GNUnet and CADET"
arch=('any')
url="http://gnunet.org"
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}")
depends=("${_mainapp}")
makedepends=('nim' 'nimble')
install="${_appname}.install"

source=("git+https://gnunet.org/git/${_extname}.git")

md5sums=('SKIP')

pkgver() {

	cd "${_extname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

	cd "${srcdir}/${_extname}"
	make

}

package() {

	cd "${srcdir}/${_extname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm644 "${pkgdir}/usr/share/${_appname}"
	install -Dm755 "${srcdir}/${_extname}/${_extname}" "${pkgdir}/usr/bin/"
	install -Dm644 "${srcdir}/${_extname}/README.rst" "${pkgdir}/usr/share/${_appname}"

}

