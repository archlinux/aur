# Contrubtor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pmw
pkgver=4.28
pkgrel=2
pkgdesc='A computer program for typesetting music - production of high quality printed sheet music.'
arch=('i686' 'x86_64')
depends=('ghostscript')
url="http://people.ds.cam.ac.uk/ph10/pmw.html"
license=('GPL')
changelog=ChangeLog
source=("http://people.ds.cam.ac.uk/ph10/$pkgname-$pkgver.tar.gz")
md5sums=('7112d2cbb9cb3d71b012879f87ab17e6')
sha1sums=('30647997034017a679b743d2f7bf41f3f9686f64')
sha256sums=('ecbd2cdeb38fb82c2a482e22119b27cc6959e26b6ae6d318ba366471781dfe13')

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
  make DESTDIR="$pkgdir" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 doc/spec.pdf $pkgdir/usr/share/doc/$pkgname/spec.pdf
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENCE
}

