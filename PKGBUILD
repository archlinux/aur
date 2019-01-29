# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.12.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow')
checkdepends=('python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('e2eb87a68d200df5ff405fd7e0ab3d0549ccd5275f3a698439bb202918a000a8')

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
    python setup.py build_ext --build-type=release \
    --with-parquet --with-plasma --with-tensor --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
  python setup.py build_ext --build-type=release \
  --with-parquet --with-plasma --with-tensor \
  install --root=$pkgdir
}

#check(){
#  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
#  py.test
#}
# vim:ts=2:sw=2:et:
