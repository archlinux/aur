# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=libsignal-protocol-c
pkgver=2.3.0
pkgrel=1
pkgdesc="Signal Protocol C Library"
arch=('i686' 'x86_64')
url="https://github.com/rizsotto/Bear"
license=('GPL3')
makedepends=('cmake')
testdepends=('check', 'openssl>=1.0')
source=(https://github.com/WhisperSystems/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('987c0ae7cd054816016e6e286cd4fd7b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ..
    # -DBUILD_TESTING=1 \

	make
}

# check() {
# 	cd "$srcdir/$pkgname-$pkgver/tests"
#   make 
#   cd ..
#   ctest
# }

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
