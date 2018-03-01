# Maintainer: Fabio Zanini <fabio.zanini __AT_ fastmail.fm>
pkgname=expressionmatrix2-git
pkgver=0.4
pkgrel=3
pkgdesc="Software for exploration of gene expression data from single-cell RNA sequencing."
url="https://github.com/chanzuckerberg/ExpressionMatrix2"
arch=('x86_64')
license=("MIT") 
depends=('python' 'boost' 'cmake' 'make' 'pybind11' 'graphviz' 'hdf5' 'python-h5py')
source=("expressionmatrix2-git::git+https://github.com/chanzuckerberg/ExpressionMatrix2.git#branch=master")
md5sums=('SKIP')

pkgver() {
  #cd "$pkgname"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  # NOTE: has no tags
  echo '0.4'
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DPYTHON_INCLUDE_PATH=/usr/include/python3.6m -DPYBIND11_INCLUDE_PATH=/usr/include/pybind11 -DHDF5_INCLUDE_PATH=/usr/include -DHDF5_LIBRARIES="hdf5_cpp hdf5" ../src
  make
}

package() {
  cd "$srcdir/$pkgname/build"

  mkdir -p "$pkgdir/usr/lib/python3.6/site-packages/"
  install -m755 ExpressionMatrix2.so "$pkgdir/usr/lib/python3.6/site-packages/"
}
