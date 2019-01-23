# Maintainer: Alois Nespor <alium@centrum.cz>
# Conributor: kikadf <kikadf.01@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab
pkgver=3.8.0
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=('i686' 'x86_64')
url='http://clipgrab.org'
license=('GPL3')
depends=('qt5-webengine')
optdepends=('ffmpeg: for the conversion functionality')
replaces=('clipgrab-qt5')
conflicts=('clipgrab-qt5')
source=(https://download.clipgrab.org/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('6573acb32b30a5d160f296a1c06237cf'
         '9a141791f6952917c441050c3dac81ce')

build() {
  cd $pkgname-$pkgver

  qmake QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" clipgrab.pro
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
