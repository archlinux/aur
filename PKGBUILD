# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-terminal-git
pkgver=20140309.f5dfc3c
pkgrel=1
pkgdesc="The Hawaii Terminal Emulator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hawaii-desktop"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols' 'yat-git')
conflicts=('hawaii-terminal')
replaces=('hawaii-terminal')
provides=('hawaii-terminal')
makedepends=('git' 'cmake')
options=('debug')

_gitroot="git://github.com/hawaii-desktop/hawaii-terminal.git"
_gitbranch=master
_gitname=terminal
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
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
