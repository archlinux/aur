# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
_appname='messenger-gtk'
pkgname="${_appname}-git"
pkgver='r107.8e8f7bf'
pkgrel=1
pkgdesc='A graphical user interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
depends=('gnunet' 'libgnunetchat-git' 'gtk3' 'libhandy' 'libnotify' 'qrencode'
         'zbar' 'gstreamer')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
source=("git+https://git.${_framework}.org/${_appname}.git")
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

