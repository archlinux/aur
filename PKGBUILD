# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=griels-quest
pkgver=1.00
pkgrel=2
pkgdesc="SDL port of a MSX1/MSX2 puzzle game (aka 'Griels Quest for the Sangraal')"
arch=('i686' 'x86_64')
url="https://code.google.com/p/griel-sangraal-linux/"
license=('GPL3')
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf' 'sdl_gfx')
makedepends=('setconf')
source=("https://griel-sangraal-linux.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha256sums=('26cff78c0a293373dad86c4a7737400c821fd0aa2df0ab1344135a88af5698f8')

prepare() {
  cd $pkgname-$pkgver
  # fix name in .desktop file
  setconf griels.desktop Exec $pkgname
  setconf griels.desktop Icon $pkgname
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver

  # binary
  install -Dm755 griels "$pkgdir"/usr/bin/$pkgname
  # data
  install -d "$pkgdir"/usr/share/griels/{music,fx,data,png}
  install -m644 music/* "$pkgdir"/usr/share/griels/music
  install -m644 fx/* "$pkgdir"/usr/share/griels/fx
  install -m644 data/* "$pkgdir"/usr/share/griels/data
  install -m644 png/* "$pkgdir"/usr/share/griels/png
  # .desktop + icon
  install -Dm644 griels.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 png/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}
