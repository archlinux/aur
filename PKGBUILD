# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=vibe-git
pkgver=20161009.1b9bb76
pkgrel=1
pkgdesc="A collection of core classes used throughout Liri"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://liri.io"
license=('LGPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-tools' 'kwallet' 'solid' 'networkmanager-qt'
         'modemmanager-qt' 'pulseaudio' 'libqtxdg' 'fluid-git')
makedepends=('git' 'extra-cmake-modules')
conflicts=('libhawaii' 'libhawaii-git' 'libpapyros' 'libpapyros-git' 'vibe')
replaces=('libhawaii' 'libhawaii-git' 'libpapyros' 'libpapyros-git' 'vibe')
provides=('vibe')
groups=('liri-git')

_gitroot="git://github.com/lirios/vibe.git"
_gitbranch=develop
_gitname=vibe
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
