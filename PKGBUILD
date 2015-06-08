# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtaccountsservice-git
pkgver=20140721.19fa06f
pkgrel=1
pkgdesc="Qt-style API for AccountsService"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop/qtaccountsservice"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative')
makedepends=('git' 'cmake')
conflicts=('qt-accountsservice-addon-git')
replaces=('qt-accountsservice-addon-git')

_gitroot="git://github.com/hawaii-desktop/qtaccountsservice.git"
_gitname="qtaccountsservice"
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
