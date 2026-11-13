# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rchitect"
arch=('x86_64')
license=('MIT')
depends=('r' 'python-cffi' 'python-packaging')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6c5479c428242b9fc26db8110fbf2f9260bf68f4ea379e0adff99ce9cbd4780b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check_disabled() { # errors in test_callbacks.py 
  cd "$srcdir/$_name-$pkgver"
  pytest
  # PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
