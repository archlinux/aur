pkgname=qtresistors
pkgver=0.1.3
pkgrel=2
pkgdesc="Calculate resistance value and tolerance of resistors by their color codes."
arch=('i686' 'x86_64')
url="https://github.com/goetzc/qtResistors"
#url="http://qt-apps.org/content/show.php/qtResistors?content=118297"
license=('GPL')
depends=('qt5-base' 'libxkbcommon-x11')
install='qtResistors.install'
source=("https://github.com/goetzc/qtResistors/archive/$pkgver.tar.gz")
sha256sums=('806982cd62f7ac29f71141e318acbd79791aa279697d04226cfb8109647e838d')

# To build using Qt 4, change to 1
_Qt4=0
[ "$_Qt4" = '1' ] && depends=('qt4')

build() {
  cd qtResistors-$pkgver/src
  
  if [ "$_Qt4" = '0' ]; then
    qmake-qt5
  elif [ "$_Qt4" = '1' ]; then
    qmake-qt4
  else
    qmake
  fi
  
  make
}

package() {
  cd qtResistors-$pkgver
  
  install -Dm755 src/qtResistors $pkgdir/usr/bin/qtResistors
  install -Dm644 qtResistors.desktop $pkgdir/usr/share/applications/qtResistors.desktop
  install -Dm644 icons/qtResistors.png $pkgdir/usr/share/icons/hicolor/64x64/apps/qtResistors.png
}
