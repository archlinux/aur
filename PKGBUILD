# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=parquet-cpp
pkgver=1.1.0
pkgrel=1
pkgdesc="A C++ library to read and write the Apache Parquet columnar data format."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('gcc-libs' 'boost-libs' 'arrow')
checkdepends=()
optdepends=()
makedepends=('brotli' 'cmake' 'snappy-static' 'thrift-static' 'boost')
source=("https://github.com/apache/parquet-cpp/archive/apache-$pkgname-$pkgver.tar.gz")
sha256sums=('7fb059900c313a5cbc6990ba5405df6076dd5f78d5430cfcb2d19d5d5f4043df')

build(){
  cd "$srcdir/$pkgname-apache-$pkgname-$pkgver"
  mkdir -p build
  cd build
  PARQUET_BUILD_TOOLCHAIN=/usr cmake .. \
    -DCMAKE_BUILD_TYPE=release \
    -DPARQUET_BUILD_TESTS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DPARQUET_ARROW=on \
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
#  cd "$srcdir/$pkgname-apache-$pkgname-$pkgver/build"
#  make test
#}
# vim:ts=2:sw=2:et:
