# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-typedload
_name=typedload
pkgver=2.14
pkgrel=2
pkgdesc='Load and dump data from json-like format into typed data structures'
arch=('any')
url='https://ltworf.github.io/typedload/'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('mypy')
source=("${_name}-$pkgver.tar.gz::https://github.com/ltworf/$_name/archive/$pkgver.tar.gz")
sha256sums=('236c4e2083f002e4debb8ab0d637ec44d7c2d1fc1eb70b432a82796a6c978dfd')

build() {
  cd "${_name}-${pkgver}"
  make setup.py
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  python -m tests
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 example.py "$pkgdir/usr/share/doc/$pkgname/example.py"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname/"
}
