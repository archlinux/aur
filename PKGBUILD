# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-randomly
pkgver=3.12.0
pkgrel=1
pkgdesc='Pytest plugin to randomly order tests and control random.seed'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-randomly'
depends=('python38-importlib-metadata' 'python38-pytest')
makedepends=('python38-setuptools')
checkdepends=('python38-factory-boy' 'python38-faker' 'python38-numpy' 'python38-pytest-xdist')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pytest-dev/pytest-randomly/archive/$pkgver.tar.gz")
sha512sums=('e2241c1304b9597f93cc57d6830808f85c59ea1b4815624dcd9d088f87eb4a34d6cb6394de9c31ebedcb8280fb6ff12b110fd5a559ab28c9e0381481fce52c4d')

build() {
  cd pytest-randomly-$pkgver
  python3.8 setup.py build
}

check() {
  cd pytest-randomly-$pkgver
  # TODO: Understand why...
  PYTHONPATH="$PWD/src" pytest --deselect tests/test_pytest_randomly.py::test_entrypoint_injection
}

package() {
  cd pytest-randomly-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
