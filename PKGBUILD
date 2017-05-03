# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.3.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow' 'jemalloc' 'parquet-cpp')
checkdepends=('python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver-rc1.tar.gz")
sha256sums=('2351698826e01b3f758998844177e3ea8bfffdafeb8b532273d7d19d0373b3a9')

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver-rc1/python"
  ARROW_HOME=/usr python setup.py build_ext --build-type=release \
    --with-parquet --with-jemalloc --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver-rc1/python"
  python setup.py install --root="$pkgdir"
}

check(){
  cd "$srcdir/arrow-apache-arrow-$pkgver-rc1/python"
  py.test
}
# vim:ts=2:sw=2:et:
