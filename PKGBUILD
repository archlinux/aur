# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=flow-tools
pkgver=0.68.5.1
pkgrel=1
pkgdesc="Netflow collector, analyser and report generator"
arch=('i686' 'x86_64')
url="http://www.splintered.net/sw/flow-tools/"
license=('custom')
depends=('zlib' 'tcp_wrappers' 'libmariaclient' 'postgresql-libs')
source=(http://flow-tools.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('b8f9a4be19ec22ea6d4031c40a6d5a63')


build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr --enable-lfs --with-mysql=/usr\
      		--with-pgsql=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR=$pkgdir install
	install -D -m444 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
