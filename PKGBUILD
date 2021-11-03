# Maintainer: Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_pyname=scikit-sparse
pkgname=python-$_pyname
pkgver=0.4.6
pkgrel=1
pkgdesc='Scikit sparse matrix package'
url="https://pypi.python.org/pypi/$_pyname/"
checkdepends=('python-nose')
depends=('python-scipy' 'suitesparse')
makedepends=('cython')
license=('GPL')
arch=('x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('f2de653920c2adf666de5c8a28abaa9f2218a1001d2d96e403a1f553938561c3')

prepare() {
  cd "$_pyname-$pkgver"
  rm -rf scikit_sparse.egg-info
  echo -e "[build_ext]\nforce = 1" >> setup.cfg
}

build() {
  cd $_pyname-$pkgver
  CFLAGS="$CFLAGS" python setup.py build
}

package() {
  cd $_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
  cd "$_pyname-$pkgver"
  python setup.py build_ext --inplace
  nosetests
}
