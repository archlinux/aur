# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=npiet
pkgver=1.3h
pkgrel=1
pkgdesc="An interpreter for piet programs. Also includes npietedit and npiet-foogol"
arch=('i686' 'x86_64')
url="https://www.bertnase.de/npiet/"
license=('GPL')
depends=('libpng' 'gd' 'giflib')
optdepends=('tk: for npietedit')
source=("https://www.bertnase.de/npiet/$pkgname-$pkgver.tar.gz")
md5sums=('a0e76f4d7ac56462e90da042e1fd5fde')
sha1sums=('07ed959187e6c438ad97566230b466b57980b980')
sha256sums=('742ffee2d2e30b84e7c1220806ae5a2339c20ad2c28377c660961cf444cd8f59')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make npiet npiet-foogol
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" MANDIR="/usr/share/man/man1" install

  # Provide some examples
  for i in examples/*
  do
    install -D -m 644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  done
}

# vim:set ts=2 sw=2 et:
