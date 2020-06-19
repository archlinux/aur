# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=chessx
pkgver=1.5.4
pkgrel=2
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-multimedia qt5-svg)
optdepends=('stockfish: for a chess engine'
            'lc0-cudnn-git: for another chess engine')
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('e2dbacff2a6c055cfbe4ce0344331f77262867e228a5fe2895e6c242772065a8')

build() {
  cd $pkgname-$pkgver
  lrelease i18n/*
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  desktop-file-install unix/$pkgname.desktop --dir "$pkgdir/usr/share/applications/"
  install -Dm644 data/images/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 release/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 ChangeLog* README* TODO -t "$pkgdir/usr/share/doc/$pkgname/"
}
