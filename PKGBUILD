# Maintainer: aksr <aksr at t-com dot me>
pkgname=xfpt
pkgver=1.00
pkgrel=1
pkgdesc='A program for turning a simple plain text markup into DocBook XML.'
arch=('i686' 'x86_64')
url="http://people.ds.cam.ac.uk/ph10/"
license=('GPL')
provides=("${pkgname%-*}")
source=("https://github.com/PhilipHazel/xfpt/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('95010ae2b487e7620f48b7ab49164ef4')
sha1sums=('7f43f7e5b75e80cb9d714ee7f5ae4dce3e9d2e3e')
sha256sums=('f840df7095edb36726c422e11f12178d865292bf0ee0d4c812573237761cf2a9')

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
	make BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share/xfpt MANDIR=$pkgdir/usr/share/man install
	install -Dm644 doc/xfpt.pdf $pkgdir/usr/share/doc/$pkgname/xfpt.pdf
	install -Dm644 doc/xfpt.html $pkgdir/usr/share/doc/$pkgname/xfpt.html
}
