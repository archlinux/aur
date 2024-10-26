# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cached-property
pkgver=2.0.1
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-freezegun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha256sums=('2680524870b43cdcd729edf49b3042612b8a4d2fa089d9f2e9ce32d8d0d5d3ba')

build() {
  cd cached-property-$pkgver
  python setup.py build
}

check() {
  # https://github.com/pydanny/cached-property/issues/131
  cd cached-property-$pkgver
  py.test || echo "Tests failed"
}

package() {
  cd cached-property-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
