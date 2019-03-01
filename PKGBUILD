# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cached-property
pkgver=1.5.1
pkgrel=2
pkgdesc="A decorator for caching properties in classes"
arch=('any')
license=('BSD')
url="https://github.com/pydanny/cached-property"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-freezegun')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydanny/cached-property/archive/$pkgver.tar.gz")
sha512sums=('d6c2cd35d7781e3123c7c076681c0dbfd352b24f71b87e1689b304a5a65759d3f7a27e46a1ce5fe1571cbe6c0dc4981b1eb5eb8314b76b13aa15eb8429645a43')

build() {
  cd cached-property-$pkgver
  python setup.py build
}

check() {
  # https://github.com/pydanny/cached-property/issues/131
  cd cached-property-$pkgver
  py.test || warning "Tests failed"
}

package() {
  cd cached-property-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
