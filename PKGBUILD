# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=parquet-cpp
pkgver=1.0.0
pkgrel=1
pkgdesc="A C++ library to read and write the Apache Parquet columnar data format."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('gcc-libs')
checkdepends=()
optdepends=()
makedepends=('brotli' 'cmake' 'gcc-libs' 'snappy-static' 'thrift-static')
source=("git+https://github.com/apache/parquet-cpp.git")
sha256sums=('SKIP')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  PARQUET_BUILD_TOOLCHAIN=/usr cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=release \
    -DPARQUET_BUILD_TESTS=off \
    -DPARQUET_BUILD_EXECUTABLES=off \
    -DPARQUET_BUILD_BENCHMARKS=off \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib"
    make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

check(){
  cd "$srcdir/build"
  make test
}
# vim:ts=2:sw=2:et:
