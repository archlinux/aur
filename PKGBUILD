# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=chessx
pkgver=1.5.8
pkgrel=1
pkgdesc="Cross-platform chess database and PGN viewer"
arch=(x86_64)
url=http://chessx.sourceforge.net
license=(GPL2)
depends=(qt5-svg qt5-speech)
makedepends=(qt5-tools)
conflicts=($pkgname-svn)
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz")
sha256sums=('7affad2b50872c5b7f46f9b3c8f559d9cd27c5f470c1bf647bbb939a6ed111a3')

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
  install -Dm644 ChangeLog* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
