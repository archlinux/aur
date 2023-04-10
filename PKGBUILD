# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=mypy-zope
pkgname=python-mypy-zope
pkgver=0.9.1
pkgrel=1
pkgdesc="Plugin for mypy to support zope.interface"
arch=('any')
url="https://pypi.org/project/mypy-zope/"
license=('MIT')
depends=('python' 'mypy' 'python-zope-interface' 'python-zope-schema')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-lxml')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4c87dbc71fec35f6533746ecdf9d400cd9281338d71c16b5676bb5ed00a97ca2')

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
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
