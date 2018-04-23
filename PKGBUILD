# Contrubtor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pmw
pkgver=4.29
pkgrel=1
pkgdesc='A computer program for typesetting music - production of high quality printed sheet music.'
arch=('i686' 'x86_64')
depends=('ghostscript')
url="http://people.ds.cam.ac.uk/ph10/pmw.html"
license=('GPL')
changelog=ChangeLog
source=("http://people.ds.cam.ac.uk/ph10/$pkgname-$pkgver.tar.gz")
md5sums=('1f06187c9e3839f7b4eccd5c396df893')
sha1sums=('e657cbb6f06bcb5956a4d0dd82ac51578ec43032')
sha256sums=('ec9ac03e7a6db15ef99c56091a68e1d183f5135b2c0c38989672fec05471b674')

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
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  mkdir $pkgdir/usr/share/doc/$pkgname/contrib
  cp contrib/* $pkgdir/usr/share/doc/$pkgname/contrib
}

