# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=robocut-git
pkgver=v1.0.11.r56.g76cc21b
pkgrel=1
pkgdesc="Graphical program that sends svg files to vinyl cutters"
url="https://github.com/sporteries/robocut"
license=('GPL3')
arch=('x86_64')
depends=('qt5-svg' 'cmake')
install=$pkgname.install
source=("$pkgname::git+$url.git"
        "$pkgname.desktop")
md5sums=('SKIP'
         '8428df609b820a04940f5e66f9c5c6c5')

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
  install -Dm644 images/robocut.xpm "$pkgdir/usr/share/pixmaps/robocut.xpm"
  install -d "$pkgdir/usr/share/robocut/examples"
  install -m644 examples/* "$pkgdir/usr/share/robocut/examples"
}
