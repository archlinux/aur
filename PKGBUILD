# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtconfiguration-git
pkgver=20140413.804739d
pkgrel=1
pkgdesc="Settings API with change notifications for Qt"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop/qtconfiguration"
license=('GPL3' 'LGPL' 'custom')
depends=('qt5-base' 'qt5-declarative' 'dconf')
makedepends=('gcc' 'git' 'cmake')

_gitroot="git://github.com/hawaii-desktop/qtconfiguration.git"
_gitname="qtconfiguration"
_gitbranch="master"
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
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
