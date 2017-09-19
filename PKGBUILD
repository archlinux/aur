# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.7.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('flatbuffers' 'rapidjson' 'boost-libs')
checkdepends=()
optdepends=()
makedepends=('cmake' 'boost' 'brotli-static' 'lz4-static' 'zlib-static' 'zstd-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('42fa110b9865194c05524a0d8cd40eca54f2489584aacfe70e8b8aa11d848427')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=OFF \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib"
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
