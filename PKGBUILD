# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-widget-styles-git
pkgver=20150330.b1e5148
pkgrel=1
pkgdesc="Hawaii widget styles"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop"
license=('LGPL')
depends=('qt5-quickcontrols')
makedepends=('git' 'extra-cmake-modules')

_gitroot="git://github.com/mauios/hawaii-widget-styles.git"
_gitbranch=master
_gitname=widget-styles
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
	export QT_SELECT=5

	cd build
	cmake ../${_gitname} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
