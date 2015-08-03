# Maintainer : Felix Yan <felixonmars@archlinux.org>

_name=repoze.profile
pkgname=(python-$_name python2-$_name)
pkgver=2.1
pkgrel=1
pkgdesc="Aggregate profiling for WSGI requests"
arch=('any')
license=('custom:BSD')
url="http://docs.repoze.org/profile/"
makedepends=('python-setuptools' 'python2-setuptools' 'pyprof2calltree' 'python2-pyprof2calltree')
checkdepends=('python-nose' 'python2-nose')
source=("http://pypi.python.org/packages/source/r/$_name/$_name-$pkgver.tar.gz")
md5sums=('50043eb6347f3f024d852062084a02b5')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  nosetests3

  cd "$srcdir/$_name-$pkgver-py2"
  nosetests2
}

package_python-repoze.profile() {
  depends=('python')
  optdepends=('pyprof2calltree')

  cd $_name-$pkgver
  python setup.py install --root="${pkgdir}"
  
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_python2-repoze.profile() {
  depends=('python2-pyprof2calltree')

  cd $_name-$pkgver-py2
  python2 setup.py install --root="${pkgdir}"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
