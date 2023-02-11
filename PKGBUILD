# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
_appname='messenger-cli'
pkgname="${_appname}-git"
pkgver='r42.0045d9f'
pkgrel=1
pkgdesc='A command line interface for GNUnet Messenger'
arch=('i686' 'x86_64')
url="https://${_framework}.org"
license=('AGPL')
makedepends=('meson')
depends=("${_framework}" 'libgnunetchat' 'ncurses')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
source=("git+https://git.${_framework}.org/${_appname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_appname}"
	PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig" meson build
}

build() {
	cd "${srcdir}/${_appname}"
	meson compile -C build
}

package() {
	cd "${srcdir}/${_appname}"
	DESTDIR="$pkgdir" meson install -C build
}

