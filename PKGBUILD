# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=parquet-cpp
pkgver=1.3.0
pkgrel=1
pkgdesc="A C++ library to read and write the Apache Parquet columnar data format."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow' 'boost-libs' 'gcc-libs')
checkdepends=()
optdepends=()
makedepends=('boost' 'cmake' 'git' 'thrift-static')
source=("https://github.com/apache/parquet-cpp/archive/apache-parquet-cpp-$pkgver.tar.gz")
sha256sums=('a93f37d5f266177e504c2fc240d7b7c4101b725903634432635d2358af2b2cd4')

build(){
  cd "$srcdir/$pkgname-apache-$pkgname-${pkgver}"
  mkdir -p build
  cd build
  PARQUET_BUILD_TOOLCHAIN=/usr cmake .. \
    -DCMAKE_BUILD_TYPE=release \
    -DPARQUET_BUILD_TESTS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_USE_SSE=on \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib"
    make
}

package(){
  cd "$srcdir/$pkgname-apache-$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install
}

#check(){
#  cd "$srcdir/$pkgname-apache-$pkgname-${pkgver/_/-}/build"
#  make test
#}
# vim:ts=2:sw=2:et:
