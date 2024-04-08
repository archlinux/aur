# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vine
pkgver=5.1.0
pkgrel=4
pkgdesc="Promises, promises, promises"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/celery/vine"
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-case')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/vine/archive/v$pkgver.tar.gz"
	"fix-removed-setup-method.patch")
sha512sums=('9ed1f18fba76fb34ed1f083a29db5a90ccffef83dbb6c2c90f83e4136520d8a27fa8b12a7ea6923c8f73532bf174d6403484fd37e0ac26247f2108aa1faabf65'
            '07b93be4a0030d96035b529d4188e03f33d431c2a941ce08e5620ee62e71b9868bc4b4932b0ea6dc3ecb7395166b6d21004db4aa9b240a8c46376a9f2cc08dcd')

prepare() {
  cd "$srcdir"/vine-$pkgver
  patch -Np1 -i ${srcdir}/fix-removed-setup-method.patch
}

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
