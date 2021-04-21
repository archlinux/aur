# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui
pkgver=1.3
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('unknown')
depends=('polkit-gnome' 'papirus-folders' 'qt5-base')
provides=('papirus-folders-gui')
conflicts=('papirus-folders-gui-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('356c015b55b0746bbb77841554ab6b5bfca3ea608c0b900c5828bb359a1472b2')
 
prepare() {
  cd "$pkgname-$pkgver/$pkgname"
  sed -i "s|/opt/$pkgname/bin/||g" papirus.desktop
}
 
build() {
  cd "$pkgname-$pkgver/$pkgname"
  qmake
  make
}
 
package() {
  cd "$pkgname-$pkgver/$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
