# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=greenisland-git
pkgver=20161001.fae8de7
pkgrel=1
pkgdesc="Qt-based compositor infrastructure for Wayland"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://hawaiios.org'
license=('GPL2' 'GPL3' 'LGPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative'
         'xkeyboard-config' 'libxkbcommon' 'fontconfig' 'freetype2')
provides=('greenisland')
conflicts=('greenisland')
replaces=('greenisland')
makedepends=('git' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')

_gitroot="git://github.com/greenisland/greenisland.git"
_gitbranch=develop
_gitname=greenisland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
