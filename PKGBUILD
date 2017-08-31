# OLD Maintainer: xduugu
# OLD Maintainer: MrSerenity
# Maintainer: derlafff (aur@2-47.ru)

pkgname=qsyncthingtray
pkgver=0.5.8
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-location' 'qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('9c359fd6b4876e293946490b57452835'
         '730d2ae862656d39f7b1980f20d8d8bf')

_pkgname=QSyncthingTray

build() {
  cd "$_pkgname-$pkgver"
  mkdir -p build
  cd build
  QTDIR=/usr/lib/qt cmake ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # install .desktop file
  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "resources/images/Icon1024.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

