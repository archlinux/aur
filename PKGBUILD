# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=1.0.1
pkgrel=1
pkgdesc="pytest plugin that allows multiple failures per test"
arch=('any')
url="https://github.com/okken/pytest-check"
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-setuptools')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('9c50cd960a74c8e8f19ced8197518850e074a631ca87b8d6db1eee3fc4ed1f3d7ed6701965734064a1bd532f9d40c0b45b5ff75e12070dda56e541c2458967c0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
