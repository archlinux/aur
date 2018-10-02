# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgbase=python-dask
pkgname=('python-dask' 'python2-dask')
_pkgname=dask
pkgver=0.19.2
pkgrel=1
pkgdesc="Minimal task scheduling abstraction"
arch=('any')
url="https://github.com/dask/dask"
license=('BSD')
#checkdepends=('ipython' 'python-bcolz' 'python2-bcolz' 'python-cachey' 'python2-cachey' 'python-graphviz' 'python2-graphviz' 'python-sparse' 'python2-sparse' 'python-pytest' 'python2-pytest')
checkdepends=('ipython' 'python-bcolz' 'python-cachey' 'python2-cachey' 'python-graphviz' 'python2-graphviz' 'python-sparse' 'python2-sparse' 'python-pytest' 'python2-pytest')
optdepends=('python-bcolz'
  'python-bokeh'
  'python-cachey'
  'python-cityhash: faster hashing'
  'python-fastparquet: Parquet support'
  'python-graphviz'
  'python-psutil'
  'python-sparse: sparse data support'
  'python-s3fs: S3 support'
  'python-gcsfs: Google Cloud Storage fs support')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/dask/dask/archive/$pkgver.tar.gz")
sha256sums=('94f3045e434953602f4712e589da7e49cda610f13d23fd5aa1dd54e608602f00')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

package_python-dask(){
  depends=('python' 'python-numpy' 'python-scipy' 'python-pandas' 'python-toolz' 'python-cloudpickle' 'python-partd>=0.3.8' 'python-yaml')
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-dask(){
  depends=('python2-numpy' 'python2-scipy' 'python2-pandas' 'python2-toolz' 'python2-cloudpickle' 'python2-partd>=0.3.8' 'python2-yaml')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}


check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test dask/tests
  #cd "$srcdir/$_pkgname-pkgver-py2"
  #py.test2 dask/tests
}
# vim:ts=2:sw=2:et:
