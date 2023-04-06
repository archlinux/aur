# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-http-parser
pkgver=0.9.0
pkgrel=7
pkgdesc="HTTP request/response parser for Python"
arch=('x86_64')
license=('MIT')
url="https://github.com/benoitc/http-parser"
depends=('python')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
source=("https://github.com/benoitc/http-parser/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('75e51bef43d9d7698aad69f8bfe651e24784b97603cac55f33bf4c12c86792c8c71d6206f31847d052e4d8621a5ea65a7b34eca5bebdb8189f58e6d98d33139d')

prepare() {
  rm http-parser-$pkgver/http_parser/parser.c
}

build() {
  cd "$srcdir"/http-parser-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/http-parser-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.10:$PYTHONPATH" \
  py.test testing/
}

package() {
  cd http-parser-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
