# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrpqrci.net>

pkgname=yfklog
pkgver=0.7.0
pkgrel=1
pkgdesc="Yet Another Ham Radio Logbook - w/ LoTW & Ncurses based"
arch=('any')
url="http://fkurz.net/ham/yfklog.html"
license=('GPL' 'FDL')
depends=('xfce4-terminal' 'texlive-core' 'perl-curses' 'perl-dbd-sqlite' \
         'perl-net-telnet' 'perl-libwww' 'cty' 'hamradio-menus')
optdepends=('hamlib: for rig control'
	    'trustedqsl: for LOTW support'
	    'xplanet: for ploted output'
	    'fldigi: for digital mode interface')
source=(http://fkurz.net/ham/$pkgname/$pkgname-$pkgver.tar.gz
        http://fkurz.net/ham/$pkgname/doc/index.html
        $pkgname.desktop
        $pkgname.png
        diff.Makefile
        output.fix)

prepare () {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile
	patch -p0 < ../output.fix

	sed -i s:'yfklog/cty.dat':'cty/cty.dat': yfksubs.pl
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/$pkgname/docs

	make DESTDIR=$pkgdir/usr install || return 1
	rm $pkgdir/usr/share/$pkgname/cty.dat

	install -m644 CHANGELOG $pkgdir/usr/share/$pkgname/docs/
	install -m644 ../*.html $pkgdir/usr/share/$pkgname/docs/

	mkdir -p $pkgdir/usr/share/{pixmaps,applications}

	install -m644 ../*.desktop $pkgdir/usr/share/applications/
	install -m644 ../*.png $pkgdir/usr/share/pixmaps
}
md5sums=('a377feba353539c87bfe368c2f6e0a57'
         '68909c28b0a741ff2d98c8ac45a2a3e9'
         'd171a1a978e2ad4038de504b8767039d'
         '90b9267746f9b1f1ecd6842e5a308a28'
         '9dd16a491c0c2b0ec0d6cd9b01fde231'
         '9b0b0ed8e0c478d70115af6eb5b5574e')
sha256sums=('3f5f08abb6cf802ff39dd3e3c80b0f4348cee88d07d818bd32db51bd840d1668'
            '6286962654ee05cd8cb0ee703ed080ca4eae9507231fa3e8466092c98428fdba'
            'b86742fd763c22fea547bc4c9c11c9a87c148f5f582a07f5a4025e8258826ae4'
            'e54bf52aa79ac2a90b8a901d9eea37c04b4a5895daee4736dde65110abb7d49d'
            'b1f3da31f7ebd05f23d5cb8499add2ec109de3fcd375da6e7b0c20d7736c2386'
            '92499ca287891aa2da21f486e170f4a2f15dd7eb7c4d9cd9801bfafd682367d5')
