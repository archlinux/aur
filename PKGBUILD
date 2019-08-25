# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrpqrci.net>

pkgname=yfklog
pkgver=0.5.0
pkgrel=1
pkgdesc="Yet Another Ham Radio Logbook - w/ LoTW & Ncurses based"
arch=('any')
url="http://fkurz.net/ham/yfklog.html"
license=('GPL' 'FDL')
depends=('cty' 'texlive-core' 'perl-curses' 'perl-dbd-sqlite' \
         'perl-net-telnet' 'hamradio-menus')
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
md5sums=('2c3fe7c0c3bc00918546e7df5ed1c18b'
         '116f628daf2efb126bba1a4352de5ed6'
         '9dafc2f3a617051ad36dd41ac4b74b34'
         '90b9267746f9b1f1ecd6842e5a308a28'
         '9dd16a491c0c2b0ec0d6cd9b01fde231'
         'a5160400a5d4014421412508ec5c1f29')
sha256sums=('ca082e0d15ba1a004fb5fda0d91244183e6077514bf4faceef04956175fc6a92'
            '6ca482050362a88b88524db140f869c9e6d2b406096116abcafc75722dfc9a54'
            'abe2f31f72a437b95315c21794fed1186988015e84b3aef26b138b5e047a55d1'
            'e54bf52aa79ac2a90b8a901d9eea37c04b4a5895daee4736dde65110abb7d49d'
            'b1f3da31f7ebd05f23d5cb8499add2ec109de3fcd375da6e7b0c20d7736c2386'
            'bed6677b575eecaeba9ff426edca3073c7cf5b63e02650f67bb4dcac12d8072a')
