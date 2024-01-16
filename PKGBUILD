# Maintainer: Alfred Dupont <alfred.dupont@no.email>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=24.1.16
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('flake8' 'python-attrs' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesmith-032')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('901dd659a352d71e23f46c230ee1618d0b22589589ad334be3b44d6a3c593cb487ce0e8f49ff6c72c691698c6f74283460b7d705dc73efe434ef07d131caeb62')

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
