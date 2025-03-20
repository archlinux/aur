# Maintainer: coldBug <coldbug@e.mail.de>

pkgname=python-partial-json-parser-git
_name=partial-json-parser
pkgver=0.2.1.1.post5
pkgrel=1
pkgdesc="A lightweight and customizable library for parsing partial JSON strings"
arch=('any')
url="https://github.com/promplate/partial-json-parser"
license=('MIT')
depends=('python-pdm-backend')
conflicts=('python-partial-json-parser')
provides=('python-partial-json-parser')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("$_name-$pkgver::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name-$pkgver
  awk -F '"' '{ print $2 }' src/partial_json_parser/version.py
}

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
