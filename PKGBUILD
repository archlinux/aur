# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.11.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'rapidjson')
checkdepends=('gflags')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'cmake' 'boost' 'brotli' 'flatbuffers-static' 'google-glog-static' 'lz4-static' 'protobuf-static' 'zlib-static' 'zstd-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('0ac629a7775d86108e403eb66d9f1a3d3bdd6b3a497a86228aa4e8143364b7cc')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr ORC_HOME=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_PARQUET=ON \
                                      -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=OFF \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib" \
                                      -DARROW_JEMALLOC=ON \
                                      -DARROW_ORC=ON \
                                      -DARROW_PLASMA=ON \
                                      -DARROW_TENSORFLOW=ON \
                                      -DARROW_USE_SSE=ON
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

#check(){
#  cd "$srcdir/build"
#  make test
#}
# vim:ts=2:sw=2:et:
