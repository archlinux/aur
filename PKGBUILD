# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qrq
pkgver=0.3.3
pkgrel=2
pkgdesc="CW trainer for Linux/Unix - similar to the DOS Classic RUFZ"
arch=('i686' 'x86_64')
url="http://fkurz.net/ham/qrq.html"
license=('GPL')
depends=('perl' 'alsa-oss' 'hamradio-menus')
makedepends=('gcc-libs')
optdepends=('gnuplot: to graph score vs. date'
            'perl-libwww: to upload scores 2 database')
source=(http://fkurz.net/ham/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname.desktop
	$pkgname.1
	warnings-as-errors.patch)

build() {
	cd $srcdir/$pkgname-$pkgver

	sed -i "s|USE_PA=YES|USE_PA=NO|" Makefile
	sed -i "s|OSX_BUNDLE=YES|OSX_BUNDLE=NO|" Makefile

	patch < ../warnings-as-errors.patch

	make
}

package() {
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir/usr install

	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/share/$pkgname/$pkgname
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -D -m 644 $pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('989164c23fe3427452dd5815aa380b54'
         'cded2f3c98941155a3d25166d8c2c3cd'
         'cf71bf05a420e3b541e0235e08dd2b2e'
         '3ffe806a1feeb94176892f9f58937c6f')
sha256sums=('306ef7f8e0bbb16bdddc58a5d9c357e9b05c1a5c8a52680e5bae093a4064e945'
            'cebb10477dabc2ea20937a1b1aafcbacc751bb9a2b62992712c473a4f737860e'
            '034e9114291270b7ab3a7006f465019658d6fb505b52b6b475694e0d369fa848'
            'add84ef146cad9aff58f22d013413fa51e724062c8aed1c350718af399a97126')
