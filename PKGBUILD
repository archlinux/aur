# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.4.1
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('flatbuffers' 'rapidjson' 'boost-libs')
checkdepends=()
optdepends=()
makedepends=('cmake' 'boost')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('a4fd4aaa3a2f671d031f0c31b4ed72df948d60c1b5aba84188b032da56e409e3')

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
