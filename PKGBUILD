# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='apache-orc'
pkgver=1.5.4
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
sha256sums=('e0026e6702b126b04724c4ac3a672273d2eeca9769c1f1d5d7306bd6fe072827')

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
