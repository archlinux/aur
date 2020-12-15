# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.4.0
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
b2sums=('4c15d0e904b2787e83faa56c31e27172da80e65225d7a5229e89b71e59c65ee7a887eb9645047634213af023ded3db4b3d15186495eccbfa792a582939be0da4')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
