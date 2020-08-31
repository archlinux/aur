# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=crusta
_pkgname=Crusta
pkgver=1.4.3.1
pkgrel=3
pkgdesc="Blazingly fast full feature web browser with unique features"
arch=('x86_64')
url="https://github.com/Crusta/CrustaBrowser"
license=('GPL3')
depends=('qt5-speech' 'qt5-svg' 'qt5-webengine')
makedepends=('qt5-charts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgname//c/C/}Browser/${_pkgname}Browser/archive/$pkgver.tar.gz")
sha256sums=('9ceb3682724226843386d70fa157ab917a2bb17db7da045f524f09f7dc7caf69')

prepare() {
  cd $_pkgname-$pkgver
  sed -i 's/ charts//' $pkgname/crusta.pro
  sed -i 's|QCoreApplication::applicationDirPath()+"|"/usr/share/crusta|
  		s|QCoreApplication::applicationDirPath()|"/usr/share/crusta"|' $pkgname/*.cpp
  sed -i 's/Exec=.*/Exec=crusta/
   	        s/Icon=.*/Icon=crusta/' Crusta.desktop
}

build() {
  cd $_pkgname-$pkgver/$pkgname
  qmake
  make
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 $pkgname/crusta "$pkgdir"/usr/bin/crusta
  install -Dm644 $pkgname/res/drawables/icon.svg "$pkgdir"/usr/share/pixmaps/crusta.svg
  install -Dm644 Crusta.desktop "$pkgdir"/usr/share/applications/crusta.desktop
  install -dm755 "$pkgdir"/usr/share/crusta/
  cp -r 3rd_party sidepanel speeddial "$pkgdir"/usr/share/crusta/
}
