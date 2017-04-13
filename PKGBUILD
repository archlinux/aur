pkgbase=python-restructuredtext_lint
pkgname=(python-restructuredtext_lint python2-restructuredtext_lint)
_pyname=restructuredtext-lint
pkgver=1.0.1
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

sha256sums=('c082e71900477317aad6dd19d3a79684f840f57c677d2c72df8aac014c5a2316')
