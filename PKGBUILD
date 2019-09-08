# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=5.0
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
provides=('python-restrictedpython')
conflicts=('python-restrictedpython')
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('21d64123be0b33cba1689a70ce94bb506c8f52f3f2d1241b8c4732de1bdf92c37b53acc5d86f8f72324e370bcb950120e278be6571c2d640bdb324909c7d5273')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Source files are inside the src directory and the module is not in the PATH when running tests
  mv src/RestrictedPython RestrictedPython
  py.test
  mv RestrictedPython src/RestrictedPython
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root $pkgdir
}
