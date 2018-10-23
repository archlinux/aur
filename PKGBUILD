# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=python-sparse
pkgname=('python-sparse' 'python2-sparse')
_pkgname=sparse
pkgver=0.5.0
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://sparse.pydata.org"
license=('BSD-3-clause')
checkdepends=('python-pytest' 'python2-pytest' 'python-pytest-cov' 'python2-pytest-cov' 'python-pytest-flake8' 'python2-pytest-flake8')
optdepends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/pydata/sparse/archive/$pkgver.tar.gz")
sha256sums=('de5766c4e0d54a42b4cf156d8c2f16b10cdc5989c16dcf85131d068e826a31c2')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

package_python-sparse(){
  depends=('python' 'python-numpy' 'python-scipy' 'python-numba')
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-sparse(){
  depends=('python' 'python2-numpy' 'python2-scipy' 'python2-numba')
  cd "$srcdir/$_pkgname-$pkgver-py2"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
  cd "$srcdir/$_pkgname-$pkgver-py2"
  py.test2
}
# vim:ts=2:sw=2:et:
