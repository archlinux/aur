# Maintainer: Stefan Seering <stefanarch@gmx.de>
pkgname=gtorrentviewer
pkgver=0.2b
pkgrel=7
pkgdesc="A torrent viewer and editor."
arch=('i686' 'x86_64')
license=('GPL')
url="http://gtorrentviewer.sourceforge.net/"
depends=('curl' 'gtk2')
makedepends=('perl-xml-parser')
source=(https://downloads.sourceforge.net/$pkgname/GTorrentViewer-$pkgver.tar.gz)
md5sums=('c29058a09f26693863404ecdb2580770')

build() {
  cd $srcdir/GTorrentViewer-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man LDFLAGS=-lm
  sed -i '/#include <curl\/types.h>/d' src/main.c
  make
}
package() {
  cd $srcdir/GTorrentViewer-$pkgver
  make DESTDIR="${pkgdir}" install
}

