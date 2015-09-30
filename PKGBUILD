# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=libhawaii-git
pkgver=20150924.402cdab
pkgrel=1
pkgdesc="Hawaii libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL3', 'LGPL3')
depends=('qt5-base' 'qt5-declarative' 'glib2')
makedepends=('git' 'gdb' 'extra-cmake-modules')
conflicts=('libhawaii')
replaces=('libhawaii')
provides=('libhawaii')
groups=('hawaii-git')
options=('debug')

_gitroot="git://github.com/hawaii-desktop/libhawaii.git"
_gitbranch=master
_gitname=libhawaii
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
