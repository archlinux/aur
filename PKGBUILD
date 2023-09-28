# Maintainer: aksr <aksr at t-com dot me>
pkgname=sdop
pkgver=1.10
pkgrel=1
pkgdesc='A typesetting program for turning a subset of DocBook XML into formatted PostScript.'
arch=('i686' 'x86_64')
url='http://people.ds.cam.ac.uk/ph10/'
license=('GPL')
provides=('sdop')
source=("https://github.com/PhilipHazel/SDoP/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('cdeb95143f3544ddc0793a5d71ad061a')
sha1sums=('b821a50ad2b4cf9d1be72025c2683844aabf3886')
sha256sums=('2d3d6c59266af104869389d253119d6af4ffd32904cfbfad75aa39f92bdfdc9b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/testing"
	./runtest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/$pkgname MANDIR=$pkgdir/usr/share/man install
	install -Dm644 doc/sdop.pdf $pkgdir/usr/share/doc/$pkgname/sdop.pdf
	install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}
