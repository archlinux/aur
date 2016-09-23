# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-gdrive
pkgver=0.9.90
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Google Drive"
url="https://projects.kde.org/kio-gdrive"
license=(GPL)
depends=(libkgapi qtkeychain)
makedepends=(extra-cmake-modules git kdesignerplugin kdoctools)
source=(http://download.kde.org/unstable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
md5sums=('a74010221dfca399c140c2e079d7abcf'
         'SKIP')
validpgpkeys=('F07D85CAA18ACF46A346FD017C7FC6EA8633B4EA') # Elvis Angelaccio <elvis.angelaccio@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
