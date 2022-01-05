# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=cmoc
pkgver=0.1.73
pkgrel=1
pkgdesc="6809-generating cross-compiler for a subset of the C language."
arch=('x86_64')
url="http://perso.b2b2c.ca/~sarrazip/dev/cmoc.html"
license=('GPL3')
depends=('perl' 'lwtools')
makedepends=('discount')
source=("http://perso.b2b2c.ca/~sarrazip/dev/$pkgname-$pkgver.tar.gz"
        "backtick.patch")
sha256sums=('01bd1e45b9588384da33335408f5afad4554eb4ed6e4ffa73eb77fc05339e785'
            '8220392b988634f29049f8dcf2d6aa7076bce9f1c0b531a1094fe25b97f61653')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/backtick.patch"
}

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
