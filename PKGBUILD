# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.5.5
pkgrel=1
pkgdesc="A columnar storage for Hadoop workloads."
arch=('x86_64')
url="https://orc.apache.org"
license=('Apache')
depends=()
options=('staticlibs')
optdepends=()
makedepends=('cmake' 'lz4-static' 'protobuf-static' 'snappy-static' 'zlib-static')
source=("orc-$pkgver.tar.gz::https://github.com/apache/orc/archive/rel/release-$pkgver.tar.gz")
sha256sums=('8dffface5d292fdb4c62e41657bf5bae5fe20d7c45b1a948f82c82b90ebb3618')

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
