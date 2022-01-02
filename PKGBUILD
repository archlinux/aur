pkgbase=python-flake8-formatter-junit-xml
pkgname=('python-flake8-formatter-junit-xml' 'python2-flake8-formatter-junit-xml')
pkgver=0.0.6
pkgrel=1
pkgdesc='JUnit XML Formatter for flake8'
arch=('any')
license=('MIT')
url='https://github.com/astj/flake8-formatter-junit-xml'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/astj/flake8-formatter-junit-xml.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a flake8-formatter-junit-xml{,-py2}
}

build() {
  cd "$srcdir"/flake8-formatter-junit-xml
  python setup.py build

  cd "$srcdir"/flake8-formatter-junit-xml-py2
  python2 setup.py build
}

package_python-flake8-formatter-junit-xml() {
  depends=('python-setuptools' 'python-junit-xml')

  cd "$srcdir"/flake8-formatter-junit-xml
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-flake8-formatter-junit-xml() {
  depends=('python2-setuptools' 'python2-junit-xml')

  cd "$srcdir"/flake8-formatter-junit-xml-py2
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
