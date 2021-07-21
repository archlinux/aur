# Maintainer: Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_pyname=scikit-sparse
pkgname=python-$_pyname
pkgver=0.4.5
pkgrel=1
pkgdesc='Scikit sparse matrix package'
url="https://pypi.python.org/pypi/$_pyname/"
checkdepends=('python-nose')
depends=('python-scipy' 'suitesparse')
makedepends=('cython')
license=('GPL')
arch=('x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('8d0cdba40cba1063474fd30bc6d3bf2b74dfb1c1fc81cf6ee45e201933d478f8')

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
