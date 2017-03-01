# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.4.4
pkgrel=1
pkgdesc="Chess Database and PGN viewer"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-multimedia qt5-svg)
optdepends=('stockfish:  For a chess engine')
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
sha256sums=('66f6cd9711d21b636caa213d8aeca06e13a13d225f2b163411535ae7956e3396')

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 "unix/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/images/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 release/$pkgname $pkgdir/usr/bin/$pkgname

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 ChangeLog TODO "$pkgdir/usr/share/doc/$pkgname/"
}
