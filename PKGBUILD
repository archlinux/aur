# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=numdiff
pkgver=5.8.1
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Program to compare files ignoring small numeric differences'
url='http://www.nongnu.org/numdiff/'
license=('GPL3')
makedepends=('gmp')
depends=('gmp')
source=(http://savannah.nongnu.org/download/$pkgname/$pkgname-$pkgver.tar.gz)
install=numdiff.install
md5sums=('a295eb391f6cb1578209fc6b4f9d994e')
options=(!buildflags)

# Don't allow '--enable-optimization' or '-O' in CFLAGS.
# See 'Known issues' on the site
# The bug reproduces on GCC 4.8.1 x86_64

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
