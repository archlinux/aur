# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.3.8
pkgrel=2
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz")
sha512sums=('a973db9d128d78f7941e6cc5e980320dc7c7930b5bba940fb2cb890af86d35206eede7adecef80dfe1970d06726bed1ffaf7532647492a0eed85c5553ee0595d')

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
