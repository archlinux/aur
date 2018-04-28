# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=biblesync  
pkgver=2.0.1
pkgrel=1
pkgdesc="multicast shared co-navigation library for Bible programs"
url="https://github.com/karlkleinpaste/biblesync.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'gcc-libs')
makedepends=('cmake')
source=("https://github.com/karlkleinpaste/biblesync/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('92c86a503dbcc22542e6f15d5fe1b5c282f209b9d4208e82bcf5207b05ed7ca33b6223a496f50108d7c28eab6e14ee14a37ccada6d0b08315ea31c0aeeae2508')

build() {
  cd $pkgname-$pkgver
  [[ -d build ]] || mkdir -p build
  cd build
  cmake -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX=/usr -DLIBDIR=/usr/lib ..
  make
}

package() {
  cd $pkgname-$pkgver/build 
  make DESTDIR=$pkgdir install
}
