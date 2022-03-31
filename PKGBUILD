# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.5.6
pkgrel=3
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(i686 x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-svg qt5-speech)
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('d09a4b534a909c5f1a398c64065049a2fdf30497bc81ccbdf0d940412364d205')

build() {
  cd $pkgname-$pkgver
  lrelease i18n/*.ts
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 unix/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 data/images/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm755 release/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 ChangeLog* README* TODO -t "$pkgdir/usr/share/doc/$pkgname/"
}
