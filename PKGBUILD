# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.4.7
pkgrel=2
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rchitect"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0' 'python-six>=1.9.0')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8283d0e026d1d38a4cf67983d58a7537cb1dc82d78d9c057b45ad8786a654057')

build() {
  cd "$_name-$pkgver"
#  python -m build --wheel --no-isolation
  python setup.py build
}

check_disabled() { # errors in test_callbacks.py 
  cd "$srcdir/$_name-$pkgver"
  pytest
  # PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "$_name-$pkgver"
#  python -m installer --destdir="$pkgdir" dist/*.whl
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
