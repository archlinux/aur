# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=chessx
pkgver=1.4.6
pkgrel=2
pkgdesc="Chess Database and PGN viewer"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-multimedia qt5-svg)
optdepends=('stockfish:  For a chess engine')
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz"
	"chessx-Qt.patch")
sha256sums=('ad951910a3bd53f5655f9e85101e7969b536078473e09a2a7dded6ef171a68ed'
            '3ded7ce88db630b6bc35c95df653a32f1fd8615378ef69cfa320a1db659a8367')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i $srcdir/chessx-Qt.patch
}
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
