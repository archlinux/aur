# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.7
pkgrel=1
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-location' 'qt5-webengine')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('53f4e634cb10795e28674833724dc4f1'
         '730d2ae862656d39f7b1980f20d8d8bf')
sha512sums=('ba807f8d2537db2318f4522e11fd01905e914bfd0efacc7ef564584a2b977c30e40fa96dd4ba39f886dc7cb702c0303befc7143de42f84119649adcc829a7ea9'
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
