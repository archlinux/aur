# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-sparse'
_pkgname=sparse
pkgver=0.12.0
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://sparse.pydata.org"
license=('BSD-3-clause')
checkdepends=('python-dask' 'python-pytest' 'python-pytest-black' 'python-pytest-cov' 'python-pytest-flake8' 'python-toolz')
depends=('python-numpy' 'python-scipy' 'python-numba')
optdepends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydata/sparse/archive/$pkgver.tar.gz"
  "black.patch::https://github.com/pydata/sparse/commit/be4fbfcd05349b4006f4600ec00f1d831b74818f.patch")
sha256sums=('2f53dd4c3d777e814d6d48664266790d981dce6521e783f0c0d39714091e0c6c'
            '942286fc85383439f40f8b7c4538d006cceb44f632db94f3d115f96b0652ef8f')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i $srcdir/black.patch
}

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

check(){
  cd "$_pkgname-$pkgver"
  PYTHONPATH=. pytest sparse
}
# vim:ts=2:sw=2:et:
