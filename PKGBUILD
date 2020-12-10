# Maintainer: Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_pyname=scikit-sparse
pkgname=python-$_pyname
pkgver=0.4.4
pkgrel=3
pkgdesc='Scikit sparse matrix package'
url="https://pypi.python.org/pypi/$_pyname/"
checkdepends=('python-nose')
depends=('python-scipy' 'suitesparse')
makedepends=('cython')
license=('GPL')
arch=('x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('e9e6741ab0a43f43071e123d7d6250c9d60373308e55f0a0c5488b8eec4df319')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"
  rm -rf scikit_sparse.egg-info
  echo -e "[build_ext]\nforce = 1" >> setup.cfg
}

build() {
  cd $srcdir/$_pyname-$pkgver
  CFLAGS="$CFLAGS" python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

check() {
  cd "${srcdir}/$_pyname-$pkgver"
  python setup.py build_ext --inplace
  nosetests
}
