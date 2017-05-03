# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.3.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('flatbuffers' 'rapidjson')
checkdepends=()
optdepends=()
makedepends=('cmake' 'flatbuffers' 'rapidjson')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver-rc1.tar.gz")
sha256sums=('2351698826e01b3f758998844177e3ea8bfffdafeb8b532273d7d19d0373b3a9')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr GFLAGS_HOME=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver-rc1/cpp -DARROW_PYTHON=ON \
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
