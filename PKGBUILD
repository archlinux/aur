# Maintainer: Raimar Bühmann <navitconfigurator@web.de>
# Contributor: raimar <navitconfigurator@web.de>

pkgname=navitconfigurator-git
pkgver=16.20130127
pkgrel=3
pkgdesc="NavitConfigurator is an editor for configuring the open source navigation program Navit. It supports Android devices to test the result directly."
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/navitconfigurat/'
license=('LGPL3')
depends=('qt4' 'qtwebkit')
makedepends=('git')
provides=('navitconfigurator')
conflicts=('navitconfigurator')
source=('git://git.code.sf.net/p/navitconfigurat/code')
md5sums=('SKIP')
recommands=('adb-git')

_gitroot="code"

pkgver() {
	cd $_gitroot
	_versionTime=$(git show -s --format="%ci" | grep -o "....-..-.." | sed "s/-//g")
	echo "$(git rev-list --count HEAD).$_versionTime"
}

build() {
	cd $_gitroot
	qmake-qt4
	make
}

package() {
	cd $_gitroot
	make INSTALL_ROOT="$pkgdir" install
} 
