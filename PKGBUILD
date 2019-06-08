# Contrubtor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=pmw
pkgver=4.31
pkgrel=1
pkgdesc='A computer program for typesetting music - production of high quality printed sheet music.'
arch=('i686' 'x86_64')
depends=('ghostscript')
url="http://people.ds.cam.ac.uk/ph10/pmw.html"
license=('GPL')
changelog=ChangeLog
source=("http://people.ds.cam.ac.uk/ph10/$pkgname-$pkgver.tar.gz")
md5sums=('6957affd878ea963c84454173e5731ce')
sha1sums=('f41a1830157fed2d50b8d3039e07bbbf597d234e')
sha256sums=('b897efa600626edf90c1a62b2a8257f9213584035fd7c2292a2286969e2bf71c')

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

