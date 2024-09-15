# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.6.2
pkgrel=1
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(x86_64)
url=http://chessx.sourceforge.net
license=(GPL-2.0-or-later)
depends=(qt5-svg qt5-speech)
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('bb091d849cb02d6309978fe284c9f1a85c274f35122fe91c6b9c3089a6e20f80')

build() {
  cd $pkgname-master
  lrelease i18n/*.ts
  qmake
  make
}

package() {
  cd $pkgname-master
  install -Dvm644 unix/$pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -Dvm644 data/images/$pkgname.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dvm755 release/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dvm644 ChangeLog* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
