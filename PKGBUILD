# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=numdiff
pkgver=5.6.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Program to compare files ignoring small numeric differences"
url="http://www.nongnu.org/numdiff/"
license=('GPL3')
makedepends=('gmp')
depends=('gmp')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
install=numdiff.install
md5sums=('96b5cae2e6a50a3fd23f1cd9b15798fd')

build() {
	cd $srcdir/$pkgname-$pkgver
  
	# unset MAKEFLAGS
	./configure --prefix=/usr --enable-optimization --enable-nls --enable-gmp
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install
	make DESTDIR=$pkgdir install-nls

	# We delete info file because there is already gzipped one
	rm $pkgdir/usr/share/info/$pkgname.info
}
