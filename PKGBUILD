# $Id$
# Maintainer: Adam Labbe <adamlabbe@gmail.com>

pkgbase=python-flake8-formatter-abspath
pkgname=('python-flake8-formatter-abspath' 'python2-flake8-formatter-abspath')
pkgver=1.0.1
pkgrel=1
pkgdesc='A flake8 formatter plugin that shows the absolute path of files with warnings.'
arch=('any')
license=('MIT')
url='https://github.com/jarshwah/flake8_formatter_abspath'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/jarshwah/flake8_formatter_abspath.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a flake8_formatter_abspath{,-py2}
}

build() {
  cd "$srcdir"/flake8_formatter_abspath
  python setup.py build

  cd "$srcdir"/flake8_formatter_abspath-py2
  python2 setup.py build
}

package_python-flake8-formatter-abspath() {
  depends=('python-setuptools')

  cd "$srcdir"/flake8_formatter_abspath
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-flake8-formatter-abspath() {
  depends=('python2-setuptools')

  cd "$srcdir"/flake8_formatter_abspath-py2
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
