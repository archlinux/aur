# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.4
pkgrel=2
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-location' 'qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('7a870c89143aaed32f4afe27b2b9cce4'
         '730d2ae862656d39f7b1980f20d8d8bf')
sha512sums=('9e289d6eb07a107e0c490dd5e3cd5ef304d845858622d6f3fd1877f93c139b7d2380407d4a091706a6ce2f3f63642ea1ef13837abbd4d37cfd68518326d002e0'
            'e0dae1d01af7f0d842da6baac6a705b83979a9a31e8e03181ea9e00a4d389bb2dff93080badadb26e5055ea80b616494687e5f69a4258a6c670a2bb5e0c96c16')

_pkgname=QSyncthingTray

build() {
  cd "$_pkgname-$pkgver"
  mkdir build
  cd build
  QTDIR=/usr/lib/qt cmake ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # install .desktop file
  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "src/images/Icon1024.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
