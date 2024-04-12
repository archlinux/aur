# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.5.3
pkgrel=2
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz")
sha512sums=('2b8028f15586d40867078dcf60e23893a72f8de00026b3b81048d9ccad86347f08c419e89af4de9aa1035a1ee277864535a7459a5ac01de9c688e0f8fbeb61f4')

prepare() {
  cd python-jsonschema-objects-$pkgver
}

build() {
  cd python-jsonschema-objects-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-jsonschema-objects-$pkgver
  pytest
}

package() {
  cd python-jsonschema-objects-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
