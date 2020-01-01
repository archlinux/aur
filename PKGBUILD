# Maintainer: MatMoul <matmoul@gmail.com>

pkgname=plasma-addons-customdesktopmenu-git
_appname=plasma-addons-customdesktopmenu
_gitname=plasma-containmentactions-customdesktopmenu
pkgver=0.1.1
pkgrel=1
pkgdesc="Custom desktop menu for Plasma5"
arch=('i686' 'x86_64')
url="https://github.com/MatMoul/plasma-containmentactions-customdesktopmenu"
license=('GPL2')
depends=('plasma-desktop')
makedepends=('git' 'make' 'cmake' 'extra-cmake-modules')
install=${pkgname}.install
options=(!emptydirs)
source=("https://github.com/MatMoul/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('1605fec314098c42062da8592db4f54391ee96dc3b0169d9b577fbd26b6d2254')

build() {
	cd ${_gitname}-${pkgver}/src
	mkdir build
	cd build
	installlibdir=$(dirname $(find /usr -name plasma_containmentactions_contextmenu.so))
	cmake -DKDE_INSTALL_LIBDIR=$installlibdir ..
	make
}

package() {
	cd ${_gitname}-${pkgver}/src/build
	installlibdir=$(dirname $(find /usr -name plasma_containmentactions_contextmenu.so))
	mkdir -p ${pkgdir}${installlibdir}
	mkdir -p ${pkgdir}/usr/local/share/kservices5
	cp plasma_containmentactions_customdesktopmenu.so ${pkgdir}${installlibdir}
	chmod -R 755 ${pkgdir}${installlibdir}
}
