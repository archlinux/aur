# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=xeus
pkgver=0.23.2
pkgrel=1
pkgdesc="C++ implementation of the Jupyter kernel protocol"
arch=("x86_64")
url="https://github.com/QuantStack/xeus"
license=('BSD')
depends=('crypto++' 'nlohmann-json' 'xtl' 'zeromq')
makedepend=('cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/QuantStack/xeus/archive/$pkgver.tar.gz"
  'Findcppzmq.cmake'
  'FindZeroMQ.cmake'
  'package.patch')
sha256sums=('62d4734a27609b389df34b56793245d4afd8f8346dba2e5c0e78bb02637a1e5c'
            '9f2f6f73af088945f0c6610d6e3024083b7dee89b0f5df2d816cd7925564108e'
            'c0d3f386032d07adcf3ee9a39cfc8df643f182d2b1190c1e7e4a3014a4f01a04'
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_MODULE_PATH=$PWD/../.. ..
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}
