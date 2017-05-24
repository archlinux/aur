# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.4.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow' 'jemalloc' 'parquet-cpp')
checkdepends=('python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('0ce9f47e42735d8d48dd83f9ff6a1612c5f2a8e846f3ae23595697e3519dd9b8')

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
    python setup.py build_ext --build-type=release \
    --with-parquet --with-jemalloc --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
  python setup.py build_ext --build-type=release \
  --with-parquet --with-jemalloc install --root=$pkgdir
}

check(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  py.test
}
# vim:ts=2:sw=2:et:
