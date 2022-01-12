# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=22.1.11
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs' 'python-setuptools')
checkdepends=('python-hypothesmith')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2f964cf7771090ecc3b51f8c86bb4077de1780dc84286ce0f594949a01021727dad6feb223456eecf6c0396be033425d44f8a21bf9ab2215a50bdac6e05f4daa')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
