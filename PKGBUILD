# Contributor: judd <jvinet@zeroflux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mawk
pkgver=1.3.4_20230203
pkgrel=1
pkgdesc="An interpreter for the AWK Programming Language"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://invisible-island.net/mawk/"
source=("$pkgname-$pkgver.tar.gz::http://invisible-island.net/datafiles/release/$pkgname.tar.gz")

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
sha256sums=('6db7a32ac79c51107ad31a407d4f92c6b842dde2f68a7533b4e7b7b03e8900be')
