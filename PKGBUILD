# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-icon-themes-git
pkgver=20150404.ae329e3
pkgrel=1
pkgdesc="Hawaii icon themes"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('LGPL')
depends=('captiva-icons-git' 'faba-icon-theme-git' 'gnome-icon-theme' 'gnome-icon-theme-symbolic' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
groups=('hawaii-git')

_gitroot="git://github.com/hawaii-desktop/hawaii-icon-themes.git"
_gitbranch=master
_gitname=icon-themes
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
