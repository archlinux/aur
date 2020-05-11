# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.16.1
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-toml')
makedepends=('python-pytest-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/v$pkgver.tar.gz")
sha512sums=('b7d9414c36432be27a26ba8bb793157625f69dd05530d6245d12c14d8245e657a5b7b96e08c90e9fa5a5d6e4f8fb03efce79a5f1a99a7cb102e516d63305308e')

build() {
  cd pytest-pylint-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-pylint-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest --ignore tmp_install
}

package() {
  cd pytest-pylint-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
