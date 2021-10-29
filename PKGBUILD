# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Kris McCleary <kris27mc@gmail.com>

pkgname=lib32-libzip
pkgver=1.8.0
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
sha512sums=('a70da02b55a7bace2b21b74f33f4d6c7c7b29f706340e2be240d0c9a307de0af4bb93d4677c087d57c651a4ca556ca362ddab2dee1ded86f2d55e54a0329a074')

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
