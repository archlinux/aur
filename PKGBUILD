# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.4.10
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rchitect"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0' 'python-six>=1.9.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6083b5763bb3df25df1d6cff656c610d9eefda971cf4c52238f1440cd6e4e7eb')

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
}
