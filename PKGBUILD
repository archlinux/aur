# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-rchitect
_name=${pkgname#python-}
pkgver=0.4.4
pkgrel=2
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/$_pkgname"
arch=('any')
license=('MIT')
depends=('r>3.4.0' 'python-cffi>=1.10.0' 'python-six>=1.9.0')
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8762b47d8636774582c906891e5b0ec66ca4d48327fb7abf7db7d85d2c137df5')

build() {
  cd "$_name-$pkgver"
#  python -m build --wheel --no-isolation
  python setup.py build
}

check_disabled() { # PytestConfigWarning: No files were found in testpaths
  cd "$srcdir/$_name-$pkgver"
  pytest
  # PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "$_name-$pkgver"
#  python -m installer --destdir="$pkgdir" dist/*.whl
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
