# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=python-typedload
_name=typedload
pkgver=2.8
pkgrel=1
pkgdesc='Load and dump data from json-like format into typed data structures'
arch=('any')
url='https://ltworf.github.io/typedload/'
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('mypy')
source=("${_name}-$pkgver.tar.gz::https://github.com/ltworf/$_name/archive/$pkgver.tar.gz")
sha256sums=('b61f02e18fbea8416373a983cadd803eb3244dd50e92ed2955a86d639bb0003a')

build() {
  cd "${_name}-${pkgver}"
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
