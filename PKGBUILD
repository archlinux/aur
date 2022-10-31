# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=npiet
pkgver=1.3f
pkgrel=1
pkgdesc="An interpreter for piet programs. Also includes npietedit and npiet-foogol"
arch=('i686' 'x86_64')
url="https://www.bertnase.de/npiet/"
license=('GPL')
depends=('libpng' 'gd' 'giflib')
optdepends=('tk: for npietedit')
source=("https://www.bertnase.de/npiet/$pkgname-$pkgver.tar.gz")
md5sums=('aad7cf28dae509046078d4c98337e670')
sha1sums=('340bc11ee1d1be4e36dfc6630e591a1c8ca289b3')
sha256sums=('2ded856062abd73599e85e1e768ce6bc60ba2db22dc7d6a9b62763dca04b855a')

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
