pkgbase=python-restructuredtext_lint
pkgname=(python-restructuredtext_lint python2-restructuredtext_lint)
_pyname=restructuredtext-lint
pkgver=1.2.2
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

sha256sums=('b6b261d64ba43766b1732ef4b1e3df8056e6c9a5a804501cdc37986c47ea50d5')
