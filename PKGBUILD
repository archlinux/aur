# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=plasma-addons-customdesktopmenu-git
_appname=plasma-addons-customdesktopmenu
_gitname=plasma-containmentactions-customdesktopmenu
pkgver=0.0.1
pkgrel=1
pkgdesc="Custom desktop menu for Plasma5"
arch=('i686' 'x86_64')
url="https://github.com/MatMoul/plasma-containmentactions-customdesktopmenu"
license=('GPL2')
makedepends=('git' 'make' 'cmake' 'extra-cmake-modules')
install=${pkgname}.install
options=(!emptydirs)
source=("git://github.com/MatMoul/${_gitname}.git")
md5sums=('SKIP')

build() {
	cd ${_gitname}/src
	mkdir build
	cd build
	installlibdir=$(dirname $(dirname $(find /usr -name plasma_containmentactions_applauncher.so)))
	cmake -DKDE_INSTALL_LIBDIR=$installlibdir ..
	make
}

package() {
	cd ${_gitname}/src/build
	installlibdir=$(dirname $(dirname $(find /usr -name plasma_containmentactions_applauncher.so)))
	mkdir -p ${pkgdir}${installlibdir}
	cp plasma_containmentactions_customdesktopmenu.so ${pkgdir}${installlibdir}
	chmod -R 755 ${pkgdir}${installlibdir}
}
