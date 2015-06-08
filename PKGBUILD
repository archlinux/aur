# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=eyesight-git
pkgver=20140929.b2cb444
pkgrel=1
pkgdesc="EyeSight: An image viewing program"
arch=('i686' 'x86_64')
url="https://github.com/hawaii-desktop"
license=('GPL2')
depends=('qt5-base' 'qt5-tools')
optdepends=('qt5-svg: for svg support'
            'qt5-imageformats: for mng, tga, tiff, bmp image support')
makedepends=('git' 'cmake')
conflicts=('hawaii-eyesight-git')
replaces=('hawaii-eyesight-git')
options=('debug')

_gitroot="git://github.com/hawaii-desktop/eyesight.git"
_gitbranch=master
_gitname=eyesight
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
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
