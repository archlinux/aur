# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='messenger-gtk'
pkgname="${_appname}-git"
pkgver='r69.62090cd'
pkgrel=1
pkgdesc='A graphical user interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://gitlab.com/gnunet-messenger/${_appname}"
license=('GPL')
depends=('gnunet' 'libgnunetchat' 'gtk3' 'libhandy' 'libnotify' 'qrencode'
         'zbar')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
source=("git+https://gitlab.com/gnunet-messenger/${_appname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_appname}"
	git submodule init
	git submodule update
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

