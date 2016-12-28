pkgbase=python-restructuredtext_lint
pkgname=(python-restructuredtext_lint python2-restructuredtext_lint)
_pyname=restructuredtext-lint
pkgver=0.17.2
pkgrel=1
arch=(any)
pkgdesc="reStructuredText linter"
url='https://pypi.python.org/pypi/restructuredtext_lint'
license=('Public Domain')
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/twolfson/restructuredtext-lint/archive/${pkgver}.tar.gz")

build() {
  cp -r $_pyname-$pkgver $_pyname-$pkgver-py2

  cd $_pyname-$pkgver
  python setup.py build

  cd "$srcdir"/$_pyname-$pkgver-py2
  python2 setup.py build
}

package_python-restructuredtext_lint() {
  cd $_pyname-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-restructuredtext_lint() {
  cd $_pyname-${pkgver}-py2 
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 UNLICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('69e88030881ded8d9e74040cd2906c48f1c6e38c19846a4bb6074d4aab1f982f')
