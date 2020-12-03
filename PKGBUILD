# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.3.9
pkgrel=3
pkgdesc="pytest plugin that allows multiple failures per test"
arch=('any')
url="https://github.com/okken/pytest-check"
license=('MIT')
depends=('python' 'python-pytest')
makedepends=('python-setuptools')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('61f6b9294ff7b3f7151b1194c6d94feeb85235a8a711c41558440f5d9ab25c9745c998a9ec2d86b4940bd8a8f70db5a562b6ff8fc03bac812d02e2b779cfe821')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
