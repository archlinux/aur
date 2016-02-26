# Maintainer: xduugu
pkgname=qsyncthingtray
pkgver=0.4.3.1
pkgrel=2
pkgdesc="tray app for syncthing"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-webengine')
makedepends=('cmake')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/QSyncthingTray/archive/$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('ce81893e6ec5f139f06d7704b7cb85f3'
         '730d2ae862656d39f7b1980f20d8d8bf')
sha512sums=('909478c98478cfdf2461a300ac7d5d5bc929600e4467d4f166e6c7bd41db5f70374744b4b70a341ffd923aaad26e65cbe2cb6caf8507019fff81ef65e525021f'
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
