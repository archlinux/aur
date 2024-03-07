# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=5.1.0
pkgrel=2
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-case')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz")
sha512sums=('9ed1f18fba76fb34ed1f083a29db5a90ccffef83dbb6c2c90f83e4136520d8a27fa8b12a7ea6923c8f73532bf174d6403484fd37e0ac26247f2108aa1faabf65')

build() {
  cd "$srcdir"/vine-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/vine-$pkgver
  pytest
}

package() {
  cd vine-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
