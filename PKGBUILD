# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.4.1
pkgrel=2
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz"
         $pkgname-nested-oneof-resolution-and-markdown.patch::https://github.com/cwacek/python-jsonschema-objects/pull/233.patch)
sha512sums=('4f47424741aa918e514f2570d316fab9feccc0e0860fe5fc6b863d2a75d4f109f80eb03e4f52549e075e83ebbd2ebceab95c5b43966650993e9bb59e94e02b63'
            'bd9543edd369eb5941cc7831e2a4c939c2e6a163e60525b72fa021b8f75c7c7b0d0bd05fe6ee3c5cfbdaac0fe47c93daf55a72b18954b7dcf6e343f4049ce579')

prepare() {
  cd python-jsonschema-objects-$pkgver
  patch -p1 < ../$pkgname-nested-oneof-resolution-and-markdown.patch
}

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
