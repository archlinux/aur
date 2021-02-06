# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: Kris McCleary <kris27mc@gmail.com>

pkgname=lib32-libzip
pkgver=1.7.3
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives"
url="https://libzip.org/"
license=('BSD')
arch=('x86_64')
depends=('lib32-zlib' 'lib32-glibc' 'lib32-openssl' 'lib32-gnutls')
makedepends=('cmake')
checkdepends=('perl')
options=('!libtool')
source=("https://libzip.org/download/libzip-$pkgver.tar.gz")
sha512sums=('3f550c41ea72b97155bb17a1936cefc5aad3d15a813a77bf4e004d6ee9e2aca4e2646f2f41429ade84e78f37f5b70b7ec0c89ce628d657e02fa8c24b85908efb')

build() {
  cd "libzip-$pkgver"
  mkdir build
  cd build

  export CCFLAGS="$CFLAGS -m32"
  export CXXFLAGS="$CXXFLAGS -m32"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib32 \
      -D_FILE_OFFSET_BITS=64 \
      ..
  make
}

check() {
  make -C "libzip-$pkgver/build" test
}

package() {
  make -C "libzip-$pkgver/build" DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{bin,include,share}
}
