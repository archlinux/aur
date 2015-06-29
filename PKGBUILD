# Contributor:  TDY <tdy@gmx.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mp3val
pkgver=0.1.8
pkgrel=2
pkgdesc="A tool for validating and repairing MPEG audio streams"
arch=('i686' 'x86_64')
url="http://mp3val.sourceforge.net/"
license=('GPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz
        $pkgname-$pkgver.diff
        $pkgname.1)
md5sums=('dc8adad909d0b8734ed22029b2de2cb4'
         'a1171f5aeb95f5a06cf0d147c5d3921a'
         '0195e80d4ea32855fd15fe76e3855acd')

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  patch -Np1 -i ../$pkgname-$pkgver.diff
  make -f Makefile.linux CXXFLAGS="$CXXFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
