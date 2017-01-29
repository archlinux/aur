# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-appcenter-git
pkgver=20161009.c38a3e2
pkgrel=1
pkgdesc="App Center for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('vibe-git' 'karchive' 'flatpak')
makedepends=('git' 'extra-cmake-modules')
conflicts=('liri-appcenter')
replaces=('liri-appcenter')
provides=('liri-appcenter')
groups=('liri-git')

_gitroot="git://github.com/lirios/appcenter.git"
_gitbranch=develop
_gitname=appcenter
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
