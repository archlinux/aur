# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=biblesync  
pkgver=1.2.0
pkgrel=3
pkgdesc="multicast shared co-navigation library for Bible programs"
url="https://github.com/karlkleinpaste/biblesync.git/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libutil-linux' 'gcc-libs')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karlkleinpaste/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ad176f8a19e2a34b984df384f7c1fb109ea8babc05250d1e66a7b874428519de91b93ec4b7014068e80f30c862827c0f2878641928ed60486d1a5e48c41e6b0c')

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
