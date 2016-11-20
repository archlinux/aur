# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=libsignal-protocol-c-git
_pkgname=libsignal-protocol-c
pkgver=2.3.0
pkgrel=1
pkgdesc="Signal Protocol C Library (git version)"
arch=('i686' 'x86_64')
url="https://github.com/rizsotto/Bear"
license=('GPL3')
conflicts=('libsignal-protocol-c')
provides=('libsignal-protocol-c')
makedepends=('cmake')
testdepends=('check', 'openssl>=1.0')
source=($_pkgname::git+https://github.com/WhisperSystems/$_pkgname)
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
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
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}
