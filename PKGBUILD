# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=parquet-cpp
pkgver=1.2.0
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
sha256sums=('625152c99400eb3995d87e585bbedf6575c9f8804d3d6b46a822f8cb27257d34')

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
