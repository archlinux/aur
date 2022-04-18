# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=22.3.23
pkgrel=3
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('flake8' 'python-attrs' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesmith')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8cd8669dbf83736b868129e450b8b39aa8c63abd2a4cd2fe2e9eabc569c91aa2fd27226d874fae90b215c104a339aca44283b4dff7dc4f243fd51cecd2d3a18e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
