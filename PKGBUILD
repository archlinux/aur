# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=hjson-cpp
pkgver=2.6
pkgrel=1
pkgdesc="Hjson for C++"
url="https://github.com/hjson/hjson-cpp"
arch=('i686' 'x86_64')
provides=('hjson-cpp')
makedepends=('cmake')
source=("https://github.com/hjson/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7c471c6713817b89d6c21c6cb4e3eb9748c896e95cc6eb676a6ce06838bcb6f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
  cd build
  cmake .. -DHJSON_ENABLE_TEST=ON -DHJSON_ENABLE_INSTALL=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  umask 022
  cd "$srcdir/$pkgname-$pkgver/build"
  make install
  rm "$pkgdir/usr/lib/hjson/"*".cmake"
}
