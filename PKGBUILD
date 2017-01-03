# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-browser-git
pkgver=20161207.1af8536
pkgrel=1
pkgdesc="Liri Browser"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'slime-engine-git')
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
	mkdir -p build
}

build() {
	cd build
	PREFIX=/usr qmake CONFIG+=QTWEBENGINE_ENABLED ../${_gitname}
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
