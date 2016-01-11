pkgbase=python-restructuredtext_lint
pkgname=(python-restructuredtext_lint python2-restructuredtext_lint)
_pyname=restructuredtext_lint
pkgver=0.14.0
pkgrel=1
arch=(any)
pkgdesc="reStructuredText linter"
url='https://pypi.python.org/pypi/restructuredtext_lint'
license=('Public Domain')
makedepends=(python-setuptools python2-setuptools)
source=("https://pypi.python.org/packages/source/r/${_pyname}/${_pyname}-${pkgver}.tar.gz")

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

sha256sums=('fb938ee83956e738e597a41e30652ca01028bbd39d8836b16a764d72b71f9c54')
