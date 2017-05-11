# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.3.0
pkgrel=2
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow' 'jemalloc' 'parquet-cpp')
checkdepends=('python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('94dc4142a4ac9dccf8f30b3dc7ab22b49140fb308512eb8bed71455fe5faaf08')

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr python setup.py build_ext --build-type=release \
    --with-parquet --with-jemalloc --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  python setup.py install --root="$pkgdir"
}

check(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  py.test
}
# vim:ts=2:sw=2:et:
