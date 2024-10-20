# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=7.4
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools" "python-installer" "python-build" "python-wheel")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('743899f4385d4a01b8b94a45a0c4bce316c9969d2b0cfb658057ec2e599b7d715116b51aa4d3e8239654e203150863a08a9c38ab790648a15689c0c34128c6fb')

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
