# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
# Maintainer: yochananmarqos
pkgname=papirus-folders-gui
pkgver=1.4
pkgrel=1
pkgdesc="A graphical user interface for papirus-folders"
url="https://github.com/ItzSelenux/papirus-folders-gui"
arch=('x86_64')
license=('unknown')
optdepends=('mate-polkit: Polkit Authentication agent, not required on most DE')
makedepends=('cmake' 'git')
depends=('polkit-gnome' 'papirus-folders' 'qt5-base')
provides=('papirus-folders-gui')
conflicts=('papirus-folders-gui-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b40aa996923a551f55f2f525687a845d29cb9110f0187b11dd8954bb2d70ee32')
 
prepare() {
  cd "$pkgname-$pkgver/$pkgname"
  sed -i "s|/opt/$pkgname/bin/||g" papirus.desktop
}
 
build() {
  cd "$pkgname-$pkgver/$pkgname"
  cmake .
  make
}
 
package() {
  cd "$pkgname-$pkgver/$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 papirus.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
