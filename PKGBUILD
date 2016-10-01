# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-gdrive
pkgver=1.0.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="KIO Slave to access Google Drive"
url="https://projects.kde.org/kio-gdrive"
license=(GPL)
depends=(libkgapi qtkeychain)
makedepends=(extra-cmake-modules git kdesignerplugin kdoctools)
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
md5sums=('fad260e60b3e97b93d218f00ce23b226'
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
