# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgbase=python-pyexecjs
pkgname=('python-pyexecjs' 'python2-pyexecjs')
pkgver=1.3.1
pkgrel=1
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/P/PyExecJS/PyExecJS-${pkgver}.tar.gz)
md5sums=('cb64d118cc48af724088f35a2e9955aa')

prepare() {
  cp -r PyExecJS-$pkgver PyExecJS-$pkgver-python
  cp -r PyExecJS-$pkgver PyExecJS-$pkgver-python2
}

build() {
  cd "PyExecJS-$pkgver-python"
  python setup.py build

  cd "../PyExecJS-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "PyExecJS-$pkgver-python"
  LC_CTYPE=en_US.utf8 python test_execjs.py || warning "Tests failed"

  cd "../PyExecJS-$pkgver-python2"
  LC_CTYPE=en_US.utf8 python2 test_execjs.py || warning "Tests failed"
}

package_python-pyexecjs() {
  depends=('python' 'python-six')

  cd "PyExecJS-$pkgver-python"
  python setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pyexecjs() {
  depends=('python2' 'python2-six')

  cd "PyExecJS-$pkgver-python2"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
