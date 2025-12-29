# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flwkey
pkgver=1.2.4
pkgrel=1
pkgdesc="Ham Radio / Morse Code - WinKeyer CW Interface control & logbook"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/fldigi/files/flwkey/"
license=('GPL-2.0-only')
depends=('fltk' 'flxmlrpc' 'hamradio-menus')
optdepends=('fldigi: for digital mode interface')	
makedepends=('autoconf' 'automake' 'pkg-config')
source=("http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz"
	"http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-help.zip"
#	"http://downloads.sourceforge.net/project/fldigi/$pkgname/${pkgname}_manual.pdf"
#	diff.src.flwkey.cxx
#	diff.src.wkey_dialog.cxx
	)

prepare() {
	cd $srcdir/$pkgname-$pkgver/src
#
#	patch -p0 < ../../diff.src.flwkey.cxx
#	patch -p0 < ../../diff.src.wkey_dialog.cxx
	sed -i s:'www.w1hkj.com':'www.w1hkj.org': flwkey.cxx
}

build() {
	cd $srcdir/$pkgname-$pkgver

	autoreconf -i
	./configure --prefix=/usr
}

check() {
	cd $srcdir/$pkgname-$pkgver

	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/doc/$pkgname
	install -m644 ../$pkgname-help/*.* $pkgdir/usr/share/doc/$pkgname
#	install -m644 ../${pkgname}_manual.pdf $pkgdir/usr/share/doc/$pkgname	
}
md5sums=('9a8402e85a872262b6ee5b1801126bac'
         '48430b102ce571866f69a5b1296b9d28')
sha256sums=('e36e86788d7543261cd8f809b4e127d62df5578a39660353c0c0e6d1a4f7c09d'
            '9ddf00109347fe737d26a3d85929e12de658a9bb6c4ecbcb02f4f41bfa6956ab')
