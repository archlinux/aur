# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=7.0
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools" "python-installer" "python-build" "python-wheel")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('c71a70ce4f71b92d87e2bdab157cba4327227da6f1be226df573c25268cbd1afbde608ffcc5d8deb6cbe063244d7611bc8792c6e17ce495c50c5812527674e2e')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=src py.test
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
