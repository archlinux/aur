# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Contributor: Colean <colean@colean.cc>
_name=ide
pkgname=bipscript-ide
pkgver=0.17
pkgrel=1
pkgdesc="IDE for the bipscript language"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('jack2' 'liblo' 'qt5-base' 'bipscript')
makedepends=('git' 'qt5-tools' 'ruby')
provides=("bipscript-ide")
conflicts=("bipscript-ide")
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.domainepublic.net/bipscript/ide/-/archive/v$pkgver/ide-v$pkgver.tar.gz")
sha256sums=('c18e3e2877aeb13abd233d5b6697dec9ce2326cb34207f5ac6de4aee732d7cae')

prepare() {
	cd "$_name-v$pkgver"
	ruby ./version.sh v$pkgver
}

build() {
	cd "$_name-v$pkgver"
	qmake-qt5 "$pkgname.pro"
	make
}

package() {
	cd "$_name-v$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}
