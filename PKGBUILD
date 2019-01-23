# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-qt5
pkgver=3.7.2
_qt5patch=3.7.1
pkgrel=3
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ... (Qt5)'
arch=('i686' 'x86_64')
url='http://clipgrab.org'
license=(GPL3)
depends=('qt5-webkit')
optdepends=('ffmpeg: for the conversion functionality')
source=(https://download.clipgrab.org/clipgrab-$pkgver.tar.gz
        $pkgname.desktop
        https://gitlab.com/kikadf/clipgrab-qt5/raw/master/clipgrab-3.7.2-allinone.patch)
md5sums=('703862f5c80838308a0778922114aa6c'
         '86ec4e7907a20dcae2c0cf6ad2438632'
         'fbda038fa191acd6c430771f815fd1e7')

prepare() {
  cd clipgrab-$pkgver
  patch -p1 -i ../clipgrab-$pkgver-allinone.patch

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
