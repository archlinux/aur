# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=npiet
pkgver=1.3d
pkgrel=2
pkgdesc="An interpreter for piet programs. Also includes npietedit and npiet-foogol"
arch=('i686' 'x86_64')
url="http://www.bertnase.de/npiet/"
license=('GPL')
depends=('libpng' 'gd' 'giflib')
optdepends=('tk: for npietedit')
source=("http://www.bertnase.de/npiet/$pkgname-$pkgver.tar.gz")
md5sums=('bb1c8c66a6859cd758bffad87da7a091')
sha1sums=('75b0858c427873e662adb0243289c53dcd868d7f')
sha256sums=('62aeabec58b672e8bfc8024183103462d8c7ca93bff7b6803c5d7bdd45c864c5')

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
