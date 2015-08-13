# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=wangle
pkgver=0.9.0
pkgrel=1
pkgdesc="A full featured, high performance C++ futures implementation"
arch=('i686' 'x86_64')
url="https://github.com/facebook/wangle"
license=('Apache')
depends=('folly' 'boost' 'boost-libs')
makedepends=('cmake' 'gflags' 'gtest' 'google-glog')
options=('!emptydirs' 'staticlibs')
source=("https://github.com/facebook/$pkgname/archive/v${pkgver}.tar.gz"
CMakeLists.txt.patch
ServiceTest.cpp.patch)
md5sums=('1b9513650968267aebf560c5b94ea3b5'
         'd5086d808c774339062e8a37e22b5921'
         '36ff005a5706ca9c5153e610ea157f37')

prepare() {
  cd "$pkgname-$pkgver/$pkgname"
  patch --verbose -p0 -i $srcdir/CMakeLists.txt.patch
  cd service
  patch --verbose -p0 -i $srcdir/ServiceTest.cpp.patch
}

build() {
  cd "$pkgname-$pkgver/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

#check() {
#  cd "$pkgname-$pkgver/$pkgname"
#  ctest
#}

package() {
  cd "$pkgname-$pkgver/$pkgname"
  make DESTDIR=$pkgdir install 
}
