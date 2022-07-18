# Maintainer: Matteo Triggiani <davvore33@gmail.com>

pkgname=mlv.app
pkgver=1.14
_pkgver=QTv$pkgver
pkgrel=0
pkgdesc='Lightroom, but for Magic Lantern MLV Video'
arch=('x86_64')
url='https://github.com/ilia3101/MLV-App'
license=('GPLv3')
makedepends=('imagemagick')
depends=('qt5-base' 'qt5-multimedia' 'ffmpeg')
source=("$url/archive/$_pkgver.tar.gz" "mlvapp.desktop")
md5sums=('977c74b542859ac6e15c2d826f532d2c'
         '25cb5da49a4bc270eb3758a1e8cdb581')
icodim="512x512"
build() {
  cd "$srcdir/MLV-App-$_pkgver/platform/qt/"
  qmake MLVApp.pro
  make
  cd "../../"
  convert "src/icon/icon.png" -resize $icodim! mlvapp.png
}

package() {
  cd "$srcdir/MLV-App-$_pkgver"
  install -Dm755 "platform/qt/mlvapp" "$pkgdir/usr/bin/mlvapp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mlvapp.png "$pkgdir/usr/share/icons/hicolor/$icodim/apps/mlvapp.png"
  cd "$srcdir"
  install -Dm755 mlvapp.desktop "$pkgdir/usr/share/applications/mlvapp.desktop"
}


