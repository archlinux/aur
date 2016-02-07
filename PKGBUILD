_pypiname=mergedict
pkgname=('python-mergedict' 'python2-mergedict')
pkgbase=python-$_pypiname
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python dict with a merge() method"
arch=(any)
url="https://pypi.python.org/pypi/mergedict"
license=('MIT')
makedepends=('python' 'python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/m/$_pypiname/$_pypiname-$pkgver.tar.gz)
md5sums=('0a52ba99f7e56f5c88670ecfe422c5f7')

prepare() {
  cp -a $_pypiname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py build

  cd "$srcdir/$_pypiname-$pkgver-py2"
  python2 setup.py build
}

package_python-mergedict() {
  depends=('python')
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-mergedict() {
  depends=('python2')
  cd "$srcdir/$_pypiname-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
