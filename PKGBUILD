# Contrubtor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pmw
pkgver=5.21
pkgrel=1
pkgdesc='A computer program for typesetting music - production of high quality printed sheet music.'
arch=('i686' 'x86_64')
depends=('ghostscript')
url="http://people.ds.cam.ac.uk/ph10/pmw.html"
license=('GPL')
source=("https://github.com/PhilipHazel/pmw/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('fa89bed9a9b5e7973287c83a067b327d')
sha1sums=('39f14c9e8d7a63f6a301c88e1611317ae29bf1fc')
sha256sums=('ba023c89f9522f8818559df69ab13cde965cb17bc61b138b2faec8537d9f42a7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver/testdist"
	./RunTests
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make \
	BINDIR="$pkgdir/usr/bin" \
	DATADIR="$pkgdir/usr/share/pmw" \
	MANDIR="$pkgdir/usr/share/man" install
	install -Dm644 doc/spec.pdf $pkgdir/usr/share/doc/$pkgname/spec.pdf
	install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
	mkdir $pkgdir/usr/share/doc/$pkgname/contrib
	cp contrib/* $pkgdir/usr/share/doc/$pkgname/contrib
}
