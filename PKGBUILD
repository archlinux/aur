# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-settings-git
pkgver=20161009.341e340
pkgrel=1
pkgdesc="Settings application and modules for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('vibe-git' 'greenisland-git' 'libqtxdg' 'qt5-accountsservice-git' 'polkit-qt5' 'xkeyboard-config')
makedepends=('git' 'extra-cmake-modules')
conflicts=('liri-settings')
replaces=('liri-settings')
provides=('liri-settings')
groups=('liri-git')

_gitroot="git://github.com/lirios/settings.git"
_gitbranch=master
_gitname=settings
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
