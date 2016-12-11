# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=npiet
pkgver=1.3e
pkgrel=1
pkgdesc="An interpreter for piet programs. Also includes npietedit and npiet-foogol"
arch=('i686' 'x86_64')
url="https://www.bertnase.de/npiet/"
license=('GPL')
depends=('libpng' 'gd' 'giflib')
optdepends=('tk: for npietedit')
source=("https://www.bertnase.de/npiet/$pkgname-$pkgver.tar.gz")
md5sums=('c593a39278ec13b3bff9e451208c92f1')
sha1sums=('344ed62bd5a62afbb001951a07493504892de33c')
sha256sums=('e819c766d12e1dfaf71561429486ed85b6ae4438da6e7ee06871ab5ce58231c5')

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
