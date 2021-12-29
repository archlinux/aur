# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=pyicumessageformat
pkgname=python-pyicumessageformat
pkgver=1.0.0
pkgrel=1
pkgdesc="An unopinionated parser for ICU MessageFormat."
arch=('any')
url="https://pypi.org/project/pyicumessageformat/"
license=('MIT')
depends=('python' 'python-setuptools' 'python-pip' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b3e97c0ed10c2b103f0f3a701aa6529700ea0ab66e0f3b23dc8e4aee181fc840')

check() {
  cd $srcdir/${_pkgname}-${pkgver}
  PYTHONPATH=./build/lib pytest
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1 --skip-build
}
