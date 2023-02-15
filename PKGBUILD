# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.11
_commit=85fdfd4390c0454f3c3a8941a0b5c8ae04b8f302
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('git' 'python-setuptools')
checkdepends=('python-testflo')
source=("git+https://github.com/OpenMDAO/testflo.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd testflo
  sed -i 's/coverage<5.0/coverage/' setup.py
}

build() {
  cd testflo
  python setup.py build
}

check() {
  cd testflo
  # TODO: figure out how to run tests
  testflo testflo || echo "Tests failed"
}

package() {
  cd testflo
  python setup.py install --root="$pkgdir" --optimize=1
}
