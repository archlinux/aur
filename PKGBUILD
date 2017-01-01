# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=slime-engine-git
pkgver=20161012.6d49035
pkgrel=1
pkgdesc="A QML Web view wrapper"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('qt5-webengine')
makedepends=('git')
conflicts=('slime-engine')
replaces=('slime-engine')
provides=('slime-engine')
groups=('liri-git')

_gitroot="git://github.com/tim-sueberkrueb/slime-engine.git"
_gitbranch=master
_gitname=slime-engine
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
	qmake ../${_gitname}
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}
