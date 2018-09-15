# Contributor: judd <jvinet@zeroflux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mawk
pkgver=1.3.4_20171017
pkgrel=2
pkgdesc="An interpreter for the AWK Programming Language"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://invisible-island.net/mawk/"
source=("$pkgname-$pkgver::http://invisible-island.net/datafiles/release/$pkgname.tar.gz")
sha256sums=('db17115d1ed18ed1607c8b93291db9ccd4fe5e0f30d2928c3c5d127b23ec9e5b')

build() {
  cd $pkgname-${pkgver/_/-}
  sed -ie 's|log()|log(1.0)|g' configure
  sed -ie "s|trap  *0|trap 'exit 0' 0|g" test/*
  ./configure 
  make -j1 
}

package () {
  cd $pkgname-${pkgver/_/-}
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man1
  make BINDIR="$pkgdir"/usr/bin \
    MANDIR="$pkgdir"/usr/share/man/man1 install 
}
