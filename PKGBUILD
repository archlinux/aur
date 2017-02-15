# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qrq
pkgver=0.3.1
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
	$pkgname.1)

build() {
	cd $srcdir/$pkgname-$pkgver

	sed -i "s|USE_PA=YES|USE_PA=NO|" Makefile
	sed -i "s|OSX_BUNDLE=YES|OSX_BUNDLE=NO|" Makefile

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
md5sums=('8ab3354d3c91c991db2654f8a6c766eb'
         'cded2f3c98941155a3d25166d8c2c3cd'
         'cf71bf05a420e3b541e0235e08dd2b2e')
sha256sums=('92988a33b7eddb3941cf91a285a57f4f0872722adf003350a8afe2caf83159a1'
            'cebb10477dabc2ea20937a1b1aafcbacc751bb9a2b62992712c473a4f737860e'
            '034e9114291270b7ab3a7006f465019658d6fb505b52b6b475694e0d369fa848')
