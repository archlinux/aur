# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miam-player
pkgver=0.8.0
pkgrel=3
pkgdesc="Cross-platform open source music player built with Qt5, QTav and Taglib."
arch=('i686' 'x86_64')
url="http://www.miam-player.org/"
license=('GPL3')
depends=('qtav' 'qt5-multimedia' 'qt5-x11extras' 'taglib')
source=($pkgname-$pkgver.tar.gz::https://github.com/MBach/Miam-Player/archive/v$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('0b00e04bc35ba33586e3ef251aa4a8f5'
         '7e4d5016d7d0610a9126bc528d4dd757')

prepare() {
  cd $srcdir/Miam-Player-$pkgver  
  qmake-qt5
}

build() {
  cd $srcdir/Miam-Player-$pkgver
  make       
}

package() {
  cd $srcdir/Miam-Player-$pkgver
  make INSTALL_ROOT=$pkgdir install

  # Desktop icon
  cd $srcdir
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  cd Miam-Player-$pkgver/debian/usr/share/icons/hicolor/64x64/apps
  install -Dm644 application-x-miamplayer.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

