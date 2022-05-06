# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='gnunet'
_appname='messenger-cli'
pkgname="${_appname}-git"
pkgver='r13.31f06ba'
pkgrel=1
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
source=("git+https://git.${_framework}.org/${_appname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_appname}"
	make release
}

package() {
	cd "${srcdir}/${_appname}"
	install -dm755 "${pkgdir}/usr/bin"
	make INSTALL_DIR="${pkgdir}/usr/" install
}

