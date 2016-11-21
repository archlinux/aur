# Contributor: judd <jvinet@zeroflux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mawk
pkgver=1.3.4_20161120
pkgrel=1
pkgdesc="An interpreter for the AWK Programming Language"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://invisible-island.net/mawk/"
source=("$pkgname-$pkgver.tar.gz::http://invisible-island.net/datafiles/release/$pkgname.tar.gz")
sha256sums=('361ec1bb4968c1f1f3b91b77493cf11b31c73ff8516f95db30e4dc28de180c1e')

build() {
  cd $srcdir/$pkgname-${pkgver/_/-}
  sed -ie 's|log()|log(1.0)|g' configure
  sed -ie "s|trap  *0|trap 'exit 0' 0|g" test/*
  ./configure 
  make -j1 
}

package () {
  cd $srcdir/$pkgname-${pkgver/_/-}
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  make BINDIR=$pkgdir/usr/bin \
    MANDIR=$pkgdir/usr/share/man/man1 install 
}
