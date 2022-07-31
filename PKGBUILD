# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-jsonschema-objects
pkgver=0.4.1
pkgrel=1
pkgdesc="Return the jsonschema-objects true value of an iterable"
url="https://github.com/cwacek/python-jsonschema-objects"
license=('MIT')
arch=('any')
depends=('python-inflection' 'python-markdown' 'python-jsonschema' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cwacek/python-jsonschema-objects/archive/$pkgver.tar.gz"
         markdown.patch)
sha512sums=('4f47424741aa918e514f2570d316fab9feccc0e0860fe5fc6b863d2a75d4f109f80eb03e4f52549e075e83ebbd2ebceab95c5b43966650993e9bb59e94e02b63'
            '49952338da8829f05eefcb8cdd2df465c01100c224aeea87e7620bfe761b2ec3cbb55733b9475c116ebd1486508a5a049cf7efa8c33219298bc8e6006deb9118')

prepare() {
  cd python-jsonschema-objects-$pkgver
  patch -p1 < ../markdown.patch # Port to recent python-markdown
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
