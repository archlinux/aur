# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.5.1
pkgrel=1
pkgdesc="A columnar storage for Hadoop workloads."
arch=('x86_64')
url="https://orc.apache.org"
license=('Apache')
depends=()
optdepends=()
makedepends=('cmake' 'lz4-static' 'protobuf-static' 'snappy-static' 'zlib-static')
source=("orc-$pkgver.tar.gz::https://github.com/apache/orc/archive/rel/release-$pkgver.tar.gz")
sha256sums=('41b4f06ab425c875987b4b6fc9e347b2b434dcc768d0537708a310bb5e6277ce')

prepare() {
  cd "$srcdir"
  mkdir -p build
}

build(){
  cd "$srcdir/build"
  cmake -DCMAKE_CXX_FLAGS="-fPIC -Wno-parentheses" \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_CPP_TESTS=OFF \
  -DCMAKE_INSTALL_PREFIX="/usr" \
  -DLZ4_HOME="/usr" \
  -DPROTOBUF_HOME="/usr" \
  -DZLIB_HOME="/usr" \
  -DSNAPPY_HOME="/usr" \
  -DBUILD_LIBHDFSPP=OFF \
  -DBUILD_JAVA=OFF \
  ../orc-rel-release-$pkgver
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

# vim:ts=2:sw=2:et:
