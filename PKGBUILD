# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-workspace-git
pkgver=20161009.b5dba67
pkgrel=1
pkgdesc="Liri workspace, programs and plugins"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://liri.io"
license=('GPL3')
depends=('qt5-tools' 'qt5-gstreamer' 'greenisland-git' 'vibe-git' 'glib2' 'dconf'
         'paper-icon-theme-git' 'ttf-dejavu' 'ttf-droid' 'noto-fonts')
makedepends=('git' 'extra-cmake-modules' 'boost')
conflicts=('hawaii-workspace-git' 'liri-workspace')
replaces=('hawaii-workspace-git' 'liri-workspace')
provides=('liri-workspace')
groups=('liri-git')
install=$pkgname.install

_gitroot="git://github.com/lirios/workspace.git"
_gitbranch=develop
_gitname=workspace
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
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
