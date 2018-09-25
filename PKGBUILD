# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=python-sparse
pkgname=('python-sparse' 'python2-sparse')
_pkgname=sparse
pkgver=0.4.1
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://sparse.pydata.org"
license=('BSD-3-clause')
checkdepends=('python-pytest' 'python2-pytest' 'python-pytest-cov' 'python2-pytest-cov' 'python-pytest-flake8' 'python2-pytest-flake8')
optdepends=()
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/pydata/sparse/archive/$pkgver.tar.gz")
sha256sums=('0a99e7df2bc6f639e9d463eae5eb4e799229760322cc1ac5e10a77f141221e45')

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
