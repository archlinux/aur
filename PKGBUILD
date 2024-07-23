# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=robocut-git
pkgver=v1.0.11.r55.gf75fbf0
pkgrel=1
pkgdesc="Graphical program that sends svg files to vinyl cutters"
url="https://github.com/Timmmm/robocut"
license=('GPL3')
arch=('x86_64')
depends=('qt5-svg' 'cmake')
install=$pkgname.install
source=("$pkgname::git+https://github.com/Timmmm/robocut.git"
        "$pkgname.desktop")
md5sums=('SKIP'
         '5757b875c1078d16110ef2d720e11f9b')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  git submodule update --init
  cmake -B build
  cmake --build build
}

package() {
  cd $srcdir/$pkgname
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -d "$pkgdir/usr/share/robocut/examples"
  install -m644 examples/* "$pkgdir/usr/share/robocut/examples"
}
