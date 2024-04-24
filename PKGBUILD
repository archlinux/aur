# Maintainer: Alfred Dupont <alfred.dupont@no.email>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=24.4.21
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('flake8' 'python-attrs' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesmith')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0ff90727690d612f06fe7231f0131d468aa1c3ffa147e6b6c040c2fc5be81f2cca0311fff0d8df6ce56412d91a2921e86726f3d283bfda57deb4c2c6f2d60686')

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
