# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=xeus
pkgver=0.23.2
pkgrel=2
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepend=('cmake' 'zeromq' 'cppzmq')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz"
  'package.patch')
sha256sums=('62d4734a27609b389df34b56793245d4afd8f8346dba2e5c0e78bb02637a1e5c'
            '83ed536b214b3f36852799a963397ac8c6f83a67b692d5f83204714b0141cbcf')
options=(staticlibs)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../package.patch
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
