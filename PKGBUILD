# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-browser-git
pkgver=20170507.c7a9463
pkgrel=1
pkgdesc="Liri Browser"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-webengine' 'fluid-git')
makedepends=('git')
conflicts=('liri-browser')
replaces=('liri-browser')
provides=('liri-browser')
groups=('liri-git')

_gitroot="git://github.com/lirios/browser.git"
_gitbranch=develop
_gitname=browser
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	cd ${srcdir}/${_gitname}
	git submodule update --init
}

build() {
	cd ${srcdir}/${_gitname}
	qmake LIRI_INSTALL_PREFIX=/usr CONFIG+=use_qt_paths -r liri-browser.pro
	make
}

package() {
	cd ${srcdir}/${_gitname}
	make INSTALL_ROOT="${pkgdir}" install
}
