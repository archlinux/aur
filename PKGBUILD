# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-tinycss
pkgname=(python-tinycss python2-tinycss)
pkgver=0.4
pkgrel=2
pkgdesc="A complete yet simple CSS parser for Python"
url="https://pypi.python.org/pypi/tinycss"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
checkdepends=('python-pytest-flake8' 'python2-pytest-flake8' 'python-pytest-cov'
              'python2-pytest-cov' 'python-pytest-isort' 'python2-pytest-isort')
source=("https://pypi.io/packages/source/t/tinycss/tinycss-$pkgver.tar.gz")
md5sums=('36b7b0e48081ebff5e6d7bbd40ad21da')

prepare() {
  cp -a tinycss-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/tinycss-$pkgver
  python setup.py build

  cd "$srcdir"/tinycss-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/tinycss-$pkgver
  py.test build

  cd "$srcdir"/tinycss-$pkgver-py2
  py.test2 build
}

package_python-tinycss() {
  depends=('python')

  cd tinycss-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-tinycss() {
  depends=('python2')

  cd tinycss-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
