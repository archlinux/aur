# Maintainer: Joe Davison <joe@warhaggis.com>

pkgname=irssistats
pkgver=0.75
pkgrel=4
pkgdesc='Parses irssi log files as stats presented in HTML'
url='http://royale.zerezo.com/irssistats/'
license=(GPL)
optdepends=('irssi')
arch=('i686' 'x86_64')
install=irssistats.install
source=('irssistats.install' "http://royale.zerezo.com/irssistats/irssistats-0.75.tar.gz")
sha256sums=('fa6a673d1df6e18981ebe5f95f20738d4bf50100bcfc0f971753b11ea617f752'
	'7aabbdb55158299997f82a39f1b403339a4ad74b4679030f317a27042d87eb90')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {    
	install -D -m 755 $srcdir/$pkgname-$pkgver/$pkgname \
		$pkgdir/usr/bin/$pkgname

	install -D -m 755 $srcdir/$pkgname-$pkgver/sample.nickfile \
		$pkgdir/etc/irssistats/sample.nickfile

	install -D -m 755 $srcdir/$pkgname-$pkgver/sample.photofile \
		$pkgdir/etc/irssistats/sample.photofile

	install -D -m 755 $srcdir/$pkgname-$pkgver/sample.configfile \
		$pkgdir/etc/irssistats/sample.configfile

	mkdir -p $pkgdir/etc/webapps/$pkgname
	cp -a $srcdir/$pkgname-$pkgver/data $pkgdir/etc/webapps/$pkgname
}
