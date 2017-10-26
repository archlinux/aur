# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin-git
pkgver=911587a
pkgrel=1
pkgdesc="Qt Creator markup plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/OneMoreGres/qtc-markview'
license=('LGPL')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-markview-plugin')
conflicts=('qtcreator-markview-plugin')
source=("$pkgname::git://github.com/OneMoreGres/qtc-markview.git")
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
