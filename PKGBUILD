# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=npiet
pkgver=1.3c
pkgrel=1
pkgdesc="An interpreter for piet programs. Also includes npietedit and npiet-foogol"
arch=('i686' 'x86_64')
url="http://www.bertnase.de/npiet/"
license=('GPL')
depends=('libpng' 'gd' 'giflib')
optdepends=('tk: for npietedit')
source=("http://www.bertnase.de/npiet/$pkgname-$pkgver.tar.gz")
md5sums=('5ffebad903a93d28ef5d9cb5c1554633')
sha1sums=('f809c5b63a552a0ffcf89505b5f2b6f28a061e2f')
sha256sums=('cd12d5e8c0b670c3689730a02179475d9f8c7f4534d372a91e41616173da0c65')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make npiet npiet-foogol
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # FIXME: broken Makefile
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/man/man1"
  make DESTDIR="$pkgdir" install

  # Provide some examples
  for i in examples/*
  do
    install -D -m 644 $i $pkgdir/usr/share/$pkgname/$i
  done
}

# vim:set ts=2 sw=2 et:
