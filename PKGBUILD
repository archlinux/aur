# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submitter: Bob Finch <w9ya@qrpqrci.net>

pkgname=yfklog
pkgver=0.3.5
pkgrel=4
pkgdesc="Yet Another Ham Radio Logbook - w/ LoTW & Ncurses based"
arch=('any')
url="http://fkurz.net/ham/yfklog.html"
license=('GPL' 'FDL')
depends=('cty' 'texlive-core' 'perl-curses' 'perl-dbd-sqlite' 'desktop-file-utils')
optdepends=('hamlib: for rig control'
	    'trustedqsl: for LOTW support'
	    'xplanet: for ploted output'
	    'fldigi: for digital mode interface')
install=$pkgname.install
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
md5sums=('b9dcffbd77d262676ed108be0ab2db0d'
         'f32b15845bb65b204c2522c4474fe96d'
         '203e7a3dddcaa0abc1a8eb44ad12b7c7'
         '90b9267746f9b1f1ecd6842e5a308a28'
         '6aa31a456ddfe674cc3bf95d53ca2817'
         '24846dfbca5f4e266ca01c320c275a3f')
sha256sums=('af46983aa8900a8b1379b0302cf7891e29e3c2af662dd96ccd7342dc2a159bbf'
            '29ed95342a188dfed7d397f04fb2fd0cdcb8337d9d946458bf5a467dab4cb995'
            '096536cb4da2c49eb8c87b1b40f57e3eb6f07c58702fdf686dd2019e01be2cb3'
            'e54bf52aa79ac2a90b8a901d9eea37c04b4a5895daee4736dde65110abb7d49d'
            'c5f3bde5b544aa99d41a57760eb6630b1269a6e07500eb7027d078175e32c926'
            '15f0b3d809db81f48dd3c9d2f10b73eaa3cfe4bf6434427c4702a0a045f014ed')
