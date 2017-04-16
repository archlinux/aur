# Maintainer: Andrew Penkrat <contact.aldrog@gmail.com>

pkgname=liri-text-git
pkgver=20170416.8039993
pkgrel=1
pkgdesc="Advanced text editor built in accordance with Material Design"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('fluid-git' 'qt5-quickcontrols')
makedepends=('git' 'qt5-tools')
conflicts=('liri-text')
provides=('liri-text')
groups=('liri-git')

_gitroot="git://github.com/lirios/text.git"
_gitbranch=develop
_gitname=text
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
	qmake LIRI_INSTALL_PREFIX=/usr ../${_gitname}
	make
}

package() {
	cd build
	make INSTALL_ROOT="${pkgdir}" install
}

