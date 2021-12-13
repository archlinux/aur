# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=5.2
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
sha512sums=('29592caf7f4b1dcac7999f364e2d799e14d8b5842fb74b0e47056c097d11e8dee89fce855fcacf71894765f6cfaa4742e60c5666f355130e9cc2870baaa73b99')

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
