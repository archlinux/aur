# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-dask
_pkgname=dask
pkgver=0.17.0
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy' 'python-pandas' 'python-toolz' 'python-cloudpickle' 'python-partd>=0.3.8' )
checkdepends=('ipython' 'python-bcolz' 'python-cachey' 'python-graphviz' 'python-sparse' 'python-pytest')
optdepends=('python-bcolz'
  'python-bokeh'
  'python-cachey'
  'python-cityhash: faster hashing'
  'python-fastparquet: Parquet support'
  'python-graphviz'
  'python-psutil'
  'python-sparse: sparse data support'
  'python-s3fs: S3 support')
makedepends=('python-setuptools')
source=("https://github.com/dask/dask/archive/$pkgver.tar.gz"
  "fix_python_lz4.patch")
sha256sums=('ff006490165aa9b22c73bc162473741ecfb2c41c6c65cf4e4a78e0f85eac23dc'
            '25812260a5e04030b9287ad1cd462c85a073eabc37f39366951e843de6bff70b')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../fix_python_lz4.patch
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test dask/tests
}
# vim:ts=2:sw=2:et:
