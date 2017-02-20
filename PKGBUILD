# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flwkey
pkgver=1.2.3
pkgrel=1
pkgdesc="Ham Radio / Morse Code - WinKeyer CW Interface control & logbook"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/fldigi/files/flwkey/"
license=('GPL')
depends=('fltk' 'flxmlrpc')
optdepends=('hamradio-menus: XDG compliant menuing'
	    'fldigi: for digital mode interface')	
makedepends=('pkg-config')
source=("http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz"
	"http://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-help.zip"
#	"http://downloads.sourceforge.net/project/fldigi/$pkgname/${pkgname}_manual.pdf"
	diff.src.flwkey.cxx
	diff.src.wkey_dialog.cxx
	)

prepare() {
	cd $srcdir/$pkgname-$pkgver/src

	patch -p0 < ../../diff.src.flwkey.cxx
	patch -p0 < ../../diff.src.wkey_dialog.cxx
}

build() {
	cd $srcdir/$pkgname-$pkgver

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
md5sums=('f7b3fbea7bc0036648f6025cdaedb56d'
         '48430b102ce571866f69a5b1296b9d28'
         'fe8115076b1dac1c8b0fe3e9c62cb321'
         '30c0a404db3e620abacbf8fd77b05b9c')
sha256sums=('7431ca23078cb13ddf566c45f79bf2b8544f2df7699f05d884829992686026bf'
            '9ddf00109347fe737d26a3d85929e12de658a9bb6c4ecbcb02f4f41bfa6956ab'
            '0785e8bdbe8b38b2b62b28ef2e016e193297eaed918d14a73474f6a6b94189d2'
            'a4082631f552501f20e3369a13eeecd66dc96af88c162422a1142c13c5314d17')
