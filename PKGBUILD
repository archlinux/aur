# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.3.14
pkgrel=1
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz")
sha512sums=('373032284c85a7f8c507c72e336d60b8c8a3e6c3938ca27f1726ac232f41e1030f3c4cb2897466008ab335286521507541f71b90b2bd8141e895bf8adfed216f')

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
