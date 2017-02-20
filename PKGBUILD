# Maintainer: Oleg Shparber <oleg@zealdocs.org>

_appname=zeal

pkgname=${_appname}-git
pkgver=0.3.1.47.g89b9d91
pkgrel=1
pkgdesc="A simple documentation browser"
arch=('i686' 'x86_64')
url="https://zealdocs.org/"
license=('GPL3')
depends=('libarchive' 'qt5-imageformats' 'qt5-webkit' 'qt5-x11extras'
         'xcb-util-keysyms' 'xdg-utils')
makedepends=('cmake' 'extra-cmake-modules' 'git')
conflicts=(${_appname})
source=("${_appname}::git+https://github.com/zealdocs/${_appname}")
sha1sums=('SKIP')

pkgver() {
	cd ${_appname}
    # TODO: Use on next version update.
    # git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ${srcdir}/${_appname}
	make
}

package() {
	cd build
	make DESTDIR=${pkgdir} install
}
