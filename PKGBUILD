# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-icon-theme-git
pkgver=20150927.3963442
pkgrel=1
pkgdesc="Hawaii icon theme"
arch=('any')
url="http://hawaiios.org"
license=('GPL3')
depends=('hicolor-icon-theme')
makedepends=('git' 'cmake')
conflicts=('hawaii-icon-theme')
replaces=('hawaii-icon-theme')
provides=('hawaii-icon-theme')
groups=('hawaii-git')

_gitroot="git://github.com/hawaii-desktop/hawaii-icon-theme.git"
_gitbranch=master
_gitname=icon-theme
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
