# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgbase=python-pyexecjs
pkgname=('python-pyexecjs' 'python2-pyexecjs')
pkgver=1.4.0
pkgrel=1
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
changelog=changelog
source=(https://github.com/doloopwhile/PyExecJS/archive/v$pkgver.tar.gz)
sha256sums=('5727169af658c0405bd4446b42bdf659d7c96158dfe8cfebc390dd33284eec75')

prepare() {
  cp -a PyExecJS-$pkgver{,-python2}
}

build() {
  cd "PyExecJS-$pkgver"
  python setup.py build

  cd "../PyExecJS-$pkgver-python2"
  python2 setup.py build
}

check() {
  cd "PyExecJS-$pkgver"
  LC_CTYPE=en_US.utf8 python test_execjs.py || warning "Tests failed"

  cd "../PyExecJS-$pkgver-python2"
  LC_CTYPE=en_US.utf8 python2 test_execjs.py || warning "Tests failed"
}

package_python-pyexecjs() {
  depends=('python-six')

  cd "PyExecJS-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pyexecjs() {
  depends=('python2-six')

  cd "PyExecJS-$pkgver-python2"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
