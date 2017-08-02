# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=numdiff
pkgver=5.9.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Program to compare files ignoring small numeric differences'
url='http://www.nongnu.org/numdiff/'
license=('GPL3')
depends=('gmp')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('794461a7285d8b9b1f2c4a8149889ea6')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --enable-nls --enable-gmp
	make
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
	make DESTDIR="$pkgdir" install-nls

	# We delete info file because there is already gzipped one
	rm "$pkgdir/usr/share/info/$pkgname.info"
}
