# Maintainer: Robert Pannick <rwpannick@gmail.com>
# Contributor: Colean <colean@colean.cc>
_name=ide
pkgname=bipscript-ide
pkgver=0.19
pkgrel=1
pkgdesc="IDE for the bipscript language"
arch=('i686' 'x86_64' 'x86_64_v3')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('jack2' 'liblo' 'qt5-base' 'bipscript')
makedepends=('git' 'qt5-tools' 'ruby' 'cmake' 'boost')
provides=("bipscript-ide")
source=("$pkgname-v$pkgver.tar.gz::https://gitlab.domainepublic.net/bipscript/ide/-/archive/v$pkgver/ide-v$pkgver.tar.gz")
sha256sums=('d309e75d8f6d0e71f49936703402b86326cc4543af444caf75b03d9d80773379')

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
