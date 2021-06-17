# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=mypy-zope
pkgname=python-mypy-zope
pkgver=0.3.1
pkgrel=1
pkgdesc="Plugin for mypy to support zope.interface"
arch=('any')
url="https://pypi.org/project/mypy-zope/"
license=('MIT')
depends=('python' 'python-setuptools' 'mypy' 'python-zope-interface' 'python-zope-schema')
checkdepends=('python-pytest' 'python-lxml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ad24e4297ddb12bd60deaefc8742cf36ad13680c0e9f879a13f2b96dc565d49e')

# Tests only work with installed package:
# https://github.com/Shoobx/mypy-zope/issues/25
#check() {
#  cd $srcdir/${_pkgname}-${pkgver}
#  PYTHONPATH=./build/lib pytest
#  # No idea how to get that to work...
#  #mypy ./src/mypy_zope --strict
#}

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python3 setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
