# Maintainer: Marcel Schneider  <marcel@coopmasters.de>
# Contributor: Kaan Genç  <aur@kaangenc.me>
pkgname=libcsv
pkgver=3.0.3
pkgrel=1
pkgdesc="A small, simple and fast CSV library written in pure ANSI C89 that can read and write CSV data."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/libcsv/"
license=('LGPL')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('d3307a7bd41d417da798cd80c80aa42a')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Replace the outdated config.sub and config.guess files. Otherwise,
  # the package doesn't build.
  cp /usr/share/libtool/build-aux/config.{sub,guess} .
}


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
