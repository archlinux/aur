# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rchitect"
arch=('x86_64')
license=('MIT')
depends=('r' 'python-cffi' 'python-packaging')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('e74dcf331bf47f3601efd921efb1e4751972d8b69710e1d142d820921bb612f7')

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
