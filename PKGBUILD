# Maintainer: aksr <aksr at t-com dot me>
pkgname=aspic
pkgver=2.00
pkgrel=1
epoch=
pkgdesc='A program for turning a textual description of a line drawing into PostScript or Scalable Vector Graphics.'
arch=('i686' 'x86_64')
url='http://people.ds.cam.ac.uk/ph10/'
license=('GPL')
provides=("${pkgname%-*}")
source=("https://github.com/PhilipHazel/aspic/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1cbfec63cb5015dadf484058c4847b33')
sha1sums=('9c5810a4bdf6e76244d02f08642b621b49b15dcd')
sha256sums=('52bb907f447b4b67d3e78670dbbaaebaed287df42b58d667f89b44293255d3e9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/testing"
	./RunTests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/$pkgname MANDIR=$pkgdir/usr/share/man install
	install -Dm644 doc/aspic.pdf $pkgdir/usr/share/doc/$pkgname/aspic.pdf
	install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
