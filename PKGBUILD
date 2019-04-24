# Maintainer: John Hammen <jhammen@j2page.com>
pkgname=bipscript-ide
pkgver=0.7
pkgrel=1
pkgdesc="IDE for the bipscript language"
arch=('i686' 'x86_64')
url="http://www.bipscript.org"
license=('GPL')
groups=('pro-audio')
depends=('jack' 'qt5-base')
makedepends=('git' 'qt5-tools' 'ruby')
provides=("bipscript-ide")
conflicts=("bipscript-ide")
source=("https://github.com/bipscript/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-v$pkgver.patch")
md5sums=('e775c796dc8b1893fb4fa16bf0030c8f'
         'c2b4c56a0e005e8231a91bd31de2cd07')

prepare() {
	cd "$pkgname-$pkgver"
        patch -p2 -i "$srcdir/$pkgname-v$pkgver.patch"
	./version.sh v$pkgver
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

