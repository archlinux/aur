# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-wallpapers-git
pkgver=20150311.8882721
pkgrel=1
pkgdesc="Wallpapers for the Hawaii desktop environment"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('GPL')
makedepends=('git' 'extra-cmake-modules')
groups=('hawaii-git')

_gitroot="git://github.com/hawaii-desktop/hawaii-wallpapers.git"
_gitbranch=master
_gitname=wallpapers
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir build
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
