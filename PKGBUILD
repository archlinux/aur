# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=1.8
pkgrel=10
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('ac55aef0d00652bc18ae90cd8507d16c91fb02992e866e154e05b3b4127461fa959aa43220d9232e7621ecf8530a2f31d854877c8a8e6b8cae1516bb62973283')

prepare() {
	cd $srcdir
	tar xvf $pkgname-$pkgver.tar.xz
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CFLAGS="$CFLAGS -DKIOSKHACK"
	qmake-qt5 PREFIX="$pkgdir/usr" DEFINES=USEUDISKS2 $pkgname.pro
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
