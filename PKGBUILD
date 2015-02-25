# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# URL: https://github.com/trollixx/aur-packages

_pkgname=qtcreator-tabbededitor-plugin
pkgname=${_pkgname}-git
pkgver=v0.0.3.24.g9f338d1
pkgrel=1
pkgdesc="QtCreator Tabbed Editor Plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/trollixx/qtcreator-tabbededitor-plugin'
license=('LGPL')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-tabbededitor-plugin')
conflicts=('qtcreator-tabbededitor-plugin')
source=("$pkgname::git://github.com/trollixx/qtcreator-tabbededitor-plugin.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --always | sed 's|-|.|g'
}

build() {
	cd $pkgname
    # TODO: QTC_BUILD=/usr
	QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr qmake LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
	make
}

package() {
	cd $pkgname
	cp -r build/* ${pkgdir}
}
