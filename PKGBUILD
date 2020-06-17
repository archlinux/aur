# Maintainer: Gergely Polonkai <gergely@polonkai.eu>

pkgname=prestopalette
pkgver=0.1.31
pkgrel=1
pkgdesc="Tool for artists to create harmonious color palettes"
arch=(x86_64)
url="http://www.prestopalette.com/"
license=(MIT)
depends=(hicolor-icon-theme qt5-multimedia)
makedepends=(imagemagick)
source=(https://github.com/PrestoPalette/PrestoPalette/releases/download/$pkgver/$pkgname-$pkgver.tar.gz
        PrestoPalette.desktop
        PrestoPalette.appdata.xml)
sha256sums=('656a1e7df7fae23dbb823609b9f8d24f8112cc3b6ca780883b6085b650168495'
            '3245ec4733f60823b6ce30b84980ad48c33c60baf224024f24f49ff619d7b18a'
            '999579fd4360a7ece78f1383c9ced7cd4caf8eaf5c4041dd98d44bc09255b50e')

build() {
  cd $pkgname-$pkgver
  convert graphics/favicon.ico +set date:create +set date:modify graphics/favicon.png
  qmake PrestoPalette.pro
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 build/release/PrestoPalette "$pkgdir/usr/bin/PrestoPalette"
  install -Dm644 ../PrestoPalette.desktop "$pkgdir/usr/share/applications/PrestoPalette.desktop"
  install -Dm644 ../PrestoPalette.appdata.xml "$pkgdir/usr/share/metainfo/PrestoPalette.appdata.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 graphics/favicon-0.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/PrestoPalette.png"
  install -Dm644 graphics/favicon-1.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/PrestoPalette.png"
  install -Dm644 graphics/favicon-2.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/PrestoPalette.png"
  install -Dm644 graphics/favicon-3.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/PrestoPalette.png"
  install -Dm644 graphics/favicon-4.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/PrestoPalette.png"
  install -Dm644 graphics/favicon-5.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/PrestoPalette.png"
}
