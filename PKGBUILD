# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript-ide
pkgver=0.5
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
md5sums=('42b50d93e644ecc7d039b54fbebc0ae1'
         '846ef29e04748b623443f3264b84ed38')

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

