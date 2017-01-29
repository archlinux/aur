# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wayland-git
pkgver=20170127.86184df
pkgrel=1
pkgdesc="QtWayland additions and QPA plugin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('systemd' 'wayland-protocols' 'libdrm' 'libinput' 'qt5-declarative' 'qt5-wayland'
         'xkeyboard-config' 'libxkbcommon' 'glib2' 'fontconfig' 'freetype2')
makedepends=('git' 'extra-cmake-modules' 'xcb-util-cursor' 'libxcursor')
provides=('liri-wayland')
conflicts=('liri-wayland')
replaces=('liri-wayland')
groups=('liri-git')

_gitroot="git://github.com/lirios/wayland.git"
_gitbranch=develop
_gitname=wayland
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
