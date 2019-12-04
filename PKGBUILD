# Maintainer: shimi <shimi.chen@gmail.com>
# Contributor: Dmytro Meleshko <dmytro.meleshko@gmail.com>

pkgname=imagewriter
pkgver=1.10.1432200249.1d253d9
_release=1.7
pkgrel=8
pkgdesc="A graphical utility for writing raw disk images & hybrid isos to USB keys"
arch=('i686' 'x86_64')
url='https://github.com/openSUSE/imagewriter'
license=('GPL2')
depends=('qt5-base' 'udisks2')
source=("http://download.opensuse.org/tumbleweed/repo/src-oss/src/$pkgname-$pkgver-${_release}.src.rpm")
sha512sums=('d7b0fff880527b8aa725704948cab7c13f6e302748d1b1ac03628adb540071c7058251e433de04493f4a17f755c6d94414def34829dbbc699ab2c45ee465f0a6')

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
