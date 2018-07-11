# OLD Maintainer: xduugu
# OLD Maintainer: MrSerenity
# OLD Maintainer: derlafff (aur@2-47.ru)
# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=qsyncthingtray-lite
_pkgname=QSyncthingTray
pkgver=0.5.8
pkgrel=2
pkgdesc="tray app for syncthing - without the default embedded web interface"
arch=('i686' 'x86_64')
url="https://github.com/sieren/QSyncthingTray"
license=('LGPL2.1')
depends=('qt5-location')
conflicts=('qsyncthingtray')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sieren/${_pkgname}/archive/$pkgver.tar.gz"
        "native-browser-support.patch::https://github.com/sieren/${_pkgname}/compare/0.5.8...96c818954e466919dd811ab99a87771e95b23cb7.patch"
        "$pkgname.desktop")
md5sums=('9c359fd6b4876e293946490b57452835'
         '02ae2878f3dd761790adc01e82c84ee1'
         '730d2ae862656d39f7b1980f20d8d8bf')

build() {
  cd "$_pkgname-$pkgver"
  patch -p1 < ../native-browser-support.patch
  mkdir -p build
  cd build
  QTDIR=/usr/lib/qt cmake -DQST_BUILD_NATIVEBROWSER=1 ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # install .desktop file
  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "resources/images/Icon1024.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

