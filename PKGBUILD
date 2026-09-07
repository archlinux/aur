# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=cmoc
pkgver=0.1.100
pkgrel=1
pkgdesc="6809-generating cross-compiler for a subset of the C language."
arch=('x86_64')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/cmoc.html"
license=('GPL3')
depends=('perl' 'lwtools')
makedepends=('discount')
source=("http://gvlsywt.cluster051.hosting.ovh.net/dev/$pkgname-$pkgver.tar.gz")

sha256sums=('52234a5f12f3d5f36a418878fc6f55e13b411f92320b98cbb72c9c15b9f24998')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make && make html
}

check() {
  cd "$pkgname-$pkgver"
  make -k check -j1
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install html documentation
  install -m644 doc/cmoc-{implementation,manual,vectrex}.html "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
