# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=robocut
pkgver=1.0.11
pkgrel=1
pkgdesc="Graphical program that sends svg files to vinyl cutters"
url="https://github.com/Timmmm/robocut"
license=('GPL3')
arch=('x86_64')
depends=('qt5-svg')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz"
        "$pkgname.desktop")
md5sums=('419592eb59e007186de1498d72ffff96'
         '5757b875c1078d16110ef2d720e11f9b')

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -d "$pkgdir/usr/share/robocut/examples"
  install -m644 examples/* "$pkgdir/usr/share/robocut/examples"
}
