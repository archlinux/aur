# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=parquet-cpp
pkgver=1.1.0
pkgrel=2
pkgdesc="A C++ library to read and write the Apache Parquet columnar data format."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('gcc-libs' 'boost-libs' 'arrow')
checkdepends=()
optdepends=()
makedepends=('boost' 'brotli' 'cmake' 'git' 'snappy-static' 'thrift-static')
source=("git+https://github.com/apache/parquet-cpp.git#commit=ce5e1e7dd6799df5411148479f0eb2626e3fff72")
sha256sums=('SKIP')

build(){
  cd "$srcdir/$pkgname"
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
  cd "$srcdir/$pkgname/build"
  make DESTDIR="${pkgdir}" install
}

#check(){
#  cd "$srcdir/$pkgname-apache-$pkgname-$pkgver/build"
#  make test
#}
# vim:ts=2:sw=2:et:
