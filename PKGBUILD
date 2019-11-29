# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=klatexformula
pkgver=4.0.0
pkgrel=7
pkgdesc="Provides GUI for generating images from LaTeX equations"
url='http://klatexformula.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python' 'qt5-base' 'qt5-tools' 'qt5-svg')
source=("http://sourceforge.net/projects/klatexformula/files/klatexformula/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz" "klfbackend.patch")
md5sums=('e69d2153e846acf3700ce7473e4a47fb'
         'c4549b8d521b97010d1dc99ba5265fec')
install="${pkgname}.install"

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	sed -i "s|(uninstall|(uninstall2|" cmake/klfinstallpaths.cmake
    sed -i "30i#include <QAction>" src/klftools/klfadvancedconfigeditor.cpp
	patch -p1 -u < ../klfbackend.patch
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
	make DESTDIR="${pkgdir}/" install
}
