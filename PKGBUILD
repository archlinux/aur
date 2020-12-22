# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=cmoc
pkgver=0.1.68
pkgrel=1
pkgdesc="6809-generating cross-compiler for a subset of the C language."
arch=('x86_64')
url="http://perso.b2b2c.ca/~sarrazip/dev/cmoc.html"
license=('GPL3')
depends=('perl' 'lwtools')
makedepends=('discount')
source=("http://perso.b2b2c.ca/~sarrazip/dev/$pkgname-$pkgver.tar.gz")
sha256sums=('fc8fd8ecb39066155ee604f77df07609f8659e09e4ccf4aaff81d2260b4a8e7a')

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
