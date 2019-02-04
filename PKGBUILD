# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript-ide
pkgver=0.4
pkgrel=1
pkgdesc="IDE for the bipscript language"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'qt5-base')
makedepends=('qt5-tools')
provides=("bipscript-ide")
conflicts=("bipscript-ide")
source=("https://github.com/bipscript/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-v$pkgver.patch")
md5sums=('bbc9fdbf6fc353bb9184343314085636'
         '0d66a2efe623b4ef93e1b43f65ad34ae')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p2 -i "$srcdir/$pkgname-v$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	qmake-qt5 "$pkgname.pro"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

