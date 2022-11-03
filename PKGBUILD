# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=6.0
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
sha512sums=('8f9b53542c0784ac0c9169c4c4252d22f95419c6903ca0e786f44f6fee9303251f3e78ec099f343068c0a7ea7712de52e884aa132dda63ed813e8a17ffe55798')

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
