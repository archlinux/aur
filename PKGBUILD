# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=hjson-cpp
pkgver=2.5
pkgrel=1
pkgdesc="Hjson for C++"
url="https://github.com/hjson/hjson-cpp"
arch=('i686' 'x86_64')
provides=('hjson-cpp')
makedepends=('cmake')
source=("https://github.com/hjson/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f064235842a39b5d8b70b296c2782226a4df73bfbbc5f7df83fb4ce522a3d665')

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
