# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-qt5
pkgver=3.6.9
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ... (Qt5)'
arch=('i686' 'x86_64')
url='http://clipgrab.org'
license=(GPL3)
depends=('qt5-webkit')
optdepends=('ffmpeg: for the conversion functionality')
source=(https://download.clipgrab.org/clipgrab-$pkgver.tar.gz
        $pkgname.desktop
        https://gitlab.com/kikadf/clipgrab-qt5/raw/patch/patch/clipgrab-qt5-${pkgver}.patch)
md5sums=('c11aebd9dfd61465484868566bd3a9e6'
         '86ec4e7907a20dcae2c0cf6ad2438632'
         '849ec64b6f3d5253001e790ba7309577')

prepare() {
  cd clipgrab-$pkgver
  patch -p1 -i ../clipgrab-qt5-${pkgver}.patch
} 

build() {
  cd clipgrab-$pkgver
  qmake clipgrab.pro
  make
}

package() {
  cd clipgrab-$pkgver
  install -Dm755 clipgrab "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
