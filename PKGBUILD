# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >

_pkgname=qt-creator-terminalplugin
pkgname=qtcreator-terminal-plugin-git
pkgver=2119fe7
pkgrel=2
pkgdesc="A konsole-like terminal plugin for Qt Creator"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/manyoso/qt-creator-terminalplugin'
license=('LGPL2.1')
depends=('qtcreator' 'qtermwidget')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-terminal-plugin')
conflicts=('qtcreator-terminal-plugin')
source=("$pkgname::git://github.com/manyoso/qt-creator-terminalplugin.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --always | sed 's|-|.|g'
}

build() {
	cd $pkgname
    # TODO: QTC_BUILD=/usr
	QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr \
        KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
        qmake LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
	make
}

package() {
	cd $pkgname
	cp -r build/* ${pkgdir}
}
