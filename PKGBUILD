# Maintainer: Gustavo Castro < gustawho [ at ] openmailbox [ dot ] org >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin-git
pkgver=r69.6fee38c
pkgrel=1
pkgdesc="Qt Creator markup plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/OneMoreGres/qtc-markview'
license=('MIT')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-markview-plugin')
conflicts=('qtcreator-markview-plugin')
source=("$pkgname::git://github.com/OneMoreGres/qtc-markview.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
