# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=5.1
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
sha512sums=('bd3bdfbd581368c0204543e4f7d0ec2f92e243ba94dee932f7c43e99beb7a857c689b054985fe66d2da36fb29b1fbc7c9234ab13aca382fa57da34d6a5065ee6')

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
