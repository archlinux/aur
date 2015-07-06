# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua> aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrpqrci.net>

pkgname=dxcc
pkgver=20080225
pkgrel=6
pkgdesc="Ham Radio - Determines ARRL DXCC entity of a callsign"
arch=('any')
url="http://fkurz.net/ham/dxcc.html"
license=('GPL')
depends=('cty' 'perl-tk' 'desktop-file-utils')
install=$pkgname.install
source=(http://fkurz.net/ham/$pkgname/$pkgname-$pkgver.tar.gz
        dxcc.desktop)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	sed -i s:'/usr/share/dxcc/cty.dat':'/usr/share/cty/cty.dat': dxcc
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/bin || return 1
	make DESTDIR=$pkgdir/usr install

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -m644 ../$pkgname.desktop $pkgdir/usr/share/applications
	install -m644 *.png $pkgdir/usr/share/pixmaps
}
md5sums=('74167d4afef980701fb2bac269117808'
         '2d79fa90731cc07fe9e8144275d8a301')
sha256sums=('a2fbd272b4b8494929a750df8f5eec704a8b469ee007d925b9ef20d7012aa274'
            '8e393a2e2dbf6621ea95dce06f800bfd72dcaa736f423e1d7ff1a60c58710a77')
