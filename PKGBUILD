# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=netwag
pkgver=5.39.0
pkgrel=1
pkgdesc="GUI for a kit of 222 network tools."
arch=('any')
url="http://www.laurentconstantin.com/en/netw/netwag/"
license=('GPL')
depends=('netwox=5.39.0' 'tk')
#source=(http://www.laurentconstantin.com/common/netw/netwag/download/v5/$pkgname-$pkgver-src.tgz)
source=(http://sourceforge.net/projects/ntwag/files/netwag/5.39/$pkgname-$pkgver-src.tgz)
md5sums=('aeb4e81b518ddeee5e324a573ab2158e')

build() {
  cd "$srcdir/$pkgname-$pkgver-src/src"
  sed -i -e 's|/local||' -e 's|/man$|/share&|' config.dat
  #sed -i 's|${netwv}||' genemake  # bypass version check
  ./genemake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src/src"
  make DESTDIR="$pkgdir" install
}
