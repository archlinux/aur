# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=zero-cache
pkgver=2.2
pkgrel=2
pkgdesc="A Open Source cross-platform distributed memory caching system based on ZMQ messaging library"
arch=(i686 x86_64)
url="http://zero-cache.blogspot.com/"
source=("git+https://github.com/ellysh/zero-cache.git#tag=$pkgver"
  'stress_value_test.cpp.patch')
license=('GPL')
depends=('zeromq')
makedepends=('cmake' 'git')
md5sums=('SKIP' 
  '9da6d84906605aa909f00af4c7a2529b') 

build() {
  cd "$srcdir/$pkgname"
  patch --verbose -p1 < "$srcdir"/stress_value_test.cpp.patch
  cmake -D CMAKE_MODULE_PATH=$PWD -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release CMakeLists.txt
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
