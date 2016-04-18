pkgbase=python-doc8
pkgname=(python-doc8 python2-doc8)
_pyname=doc8
pkgver=0.7.0
pkgrel=1
arch=(any)
pkgdesc="Style checker for Sphinx (or other) RST documentation"
url='https://pypi.python.org/pypi/doc8'
license=('Apache 2.0')
makedepends=(python-setuptools python2-setuptools)
source=("https://pypi.python.org/packages/source/d/${_pyname}/${_pyname}-${pkgver}.tar.gz")

build() {
  cp -r $_pyname-$pkgver $_pyname-$pkgver-py2

  cd $_pyname-$pkgver
  python setup.py build

  cd "$srcdir"/$_pyname-$pkgver-py2
  python2 setup.py build
}

package_python-doc8() {
  depends=('python-stevedore' 'python-chardet' 'python-docutils' 'python-argparse' 'python-six' 'python-restructuredtext_lint')
  cd $_pyname-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-doc8() {
  depends=('python2-stevedore' 'python2-chardet' 'python2-docutils' 'python2-argparse' 'python2-six' 'python2-restructuredtext_lint')
  cd $_pyname-${pkgver}-py2 
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('b89824683a23361c3f1f6ce8743cc97c86570596455dee1bb67d555f2106af06')
