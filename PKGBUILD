# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.3.12
pkgrel=2
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz")
sha512sums=('cab0d413375677f1204b236703865fdff43763a68bf0cdf82460c953aed51376c581102f6588377a51b259cbe8a1095c90b50789dc18fcd328c8f60b669631a4')

build() {
  cd python-jsonschema-objects-$pkgver
  python setup.py build
}

check() {
  cd python-jsonschema-objects-$pkgver
  python setup.py pytest --addopts --doctest-glob='python_jsonschema_objects/*.md'
}

package() {
  cd python-jsonschema-objects-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
