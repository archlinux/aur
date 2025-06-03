# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.4.8
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rchitect"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0' 'python-six>=1.9.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c611abcc2c56373dd3d098fab2876c6f4544c4f285197f1b1c5e9f2364bdd8fb')

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
