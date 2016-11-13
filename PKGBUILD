# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-shell-git
pkgver=20161016.c2269e8
pkgrel=1
pkgdesc="QtQuick and Wayland based shell for convergence"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://liri.io'
license=('GPL3')
depends=('qt5-tools' 'qt5-wayland' 'qt5-accountsservice-git'
         'pam' 'greenisland-git' 'vibe-git' 'liri-workspace-git')
optdepends=('weston: nested mode support')
makedepends=('git' 'extra-cmake-modules')
conflicts=('hawaii-shell-git' 'papyros-shell-git' 'liri-shell')
replaces=('hawaii-shell-git' 'papyros-shell-git' 'liri-shell')
provides=('liri-shell')
groups=('liri-git')

_gitroot="git://github.com/lirios/shell.git"
_gitbranch=develop
_gitname=shell
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
