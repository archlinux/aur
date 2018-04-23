# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=biblesync  
pkgver=2.0.0
pkgrel=1
pkgdesc="multicast shared co-navigation library for Bible programs"
url="https://github.com/karlkleinpaste/biblesync.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'gcc-libs')
makedepends=('cmake')
source=("https://github.com/karlkleinpaste/biblesync/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6ba649d42d791e9d14feb9c06f5673f51948f51c5154bb34eaee2e24dc21dcde1f3eeb5d87f0ad8021d999c6e07ea9a54e0b8ac353de6e7e1e8c4d01fbfd5dcc')

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
