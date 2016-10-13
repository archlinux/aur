# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-themes-git
pkgver=20161012.a5808c4
pkgrel=1
pkgdesc="Themes for uniform look and feel throughout Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='http://liri.io'
license=('GPL3')
makedepends=('git' 'extra-cmake-modules')
conflicts=('liri-themes')
replaces=('liri-themes')
provides=('liri-themes')
groups=('liri-git')

_gitroot="git://github.com/lirios/themes.git"
_gitbranch=develop
_gitname=themes
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
