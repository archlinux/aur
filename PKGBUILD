# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-wallpapers-git
pkgver=20170101.6cb197f
pkgrel=1
pkgdesc="Wallpapers for Liri OS"
arch=('any')
url='https://liri.io'
license=('CCPL')
makedepends=('git' 'extra-cmake-modules')
conflicts=('hawaii-wallpapers-git' 'liri-wallpapers')
replaces=('hawaii-wallpapers-git' 'liri-wallpapers')
provides=('liri-wallpapers')
groups=('liri-git')

_gitroot="git://github.com/lirios/wallpapers.git"
_gitbranch=develop
_gitname=wallpapers
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
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
