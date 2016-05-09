# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

pkgbase=python-pyexecjs
pkgname=('python-pyexecjs' 'python2-pyexecjs')
pkgver=1.4.0
pkgrel=1
pkgdesc="Run JavaScript code from Python."
arch=('any')
url="https://pypi.python.org/pypi/PyExecJS"
license=('MIT')
makedepends=('python-packaging' 'python2-packaging' 'git')
changelog=changelog
source=(git+https://github.com/doloopwhile/PyExecJS.git#tag=v$pkgver)
sha512sums=('SKIP')

prepare() {
  cp -a PyExecJS{,-python2}
}

build() {
  cd "PyExecJS"
  python setup.py build

  cd "../PyExecJS-python2"
  python2 setup.py build
}

check() {
  cd "PyExecJS"
  LC_CTYPE=en_US.utf8 python test_execjs.py || warning "Tests failed"

  cd "../PyExecJS-python2"
  LC_CTYPE=en_US.utf8 python2 test_execjs.py || warning "Tests failed"
}

package_python-pyexecjs() {
  depends=('python-six')

  cd "PyExecJS"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pyexecjs() {
  depends=('python2-six')

  cd "PyExecJS-python2"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
