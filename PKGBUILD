# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.18.0
pkgrel=3
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-toml')
makedepends=('python-pytest-flake8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/v$pkgver.tar.gz")
sha512sums=('a0716104d288774d4c3ab596f30a33cf439df5031647912574c31eefc3a84e69e82fc362f77e73b437c7566a596d2ff8bf51a332626a7fa7468cea3b916e9ad9')

build() {
  cd pytest-pylint-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-pylint-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.9/site-packages:$PYTHONPATH" pytest --ignore tmp_install
}

package() {
  cd pytest-pylint-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
