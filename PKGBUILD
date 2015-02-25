# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

pkgname=qtcreator-tabbededitor-plugin-git
pkgver=v0.0.3.1.g154a0a3
pkgrel=1
pkgdesc="QtCreator Tabbed Editor Plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/tabbededitor/"
license=('GPL3' 'LGPL')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
replaces=()
provides=('qtcreator-tabbededitor-plugin')
conflicts=()
source=('git://github.com/trollixx/qtcreator-tabbededitor-plugin.git')
md5sums=('SKIP')
_gitname="qtcreator-tabbededitor-plugin"

pkgver() {
	cd ${srcdir}/${_gitname}
	git describe --always | sed 's|-|.|g'
}

build() {
	cd ${srcdir}/${_gitname}
	QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build qmake LIBS+="-L/usr/lib/qtcreator/ -L/usr/lib/qtcreator/plugins/QtProject"
	make
}

package() {
	cd ${srcdir}/${_gitname}
	cp -r build/* ${pkgdir}
}
