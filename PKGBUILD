pkgbase=python-restructuredtext_lint
pkgname=(python-restructuredtext_lint python2-restructuredtext_lint)
_pyname=restructuredtext-lint
pkgver=1.3.0
pkgrel=1
arch=(any)
pkgdesc="reStructuredText linter"
url='https://pypi.python.org/pypi/restructuredtext_lint'
license=('Public Domain')
makedepends=(python-setuptools python2-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/twolfson/restructuredtext-lint/archive/${pkgver}.tar.gz")

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

sha256sums=('4bf9d4724f59bc05ebe1cd5192c03d4597ee95c4bbf60bd5644422e1a2558da3')
