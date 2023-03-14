# Contributor: oldNo.7 <oldNo.7@archlinux.org>

_pkgname=python-thefuzz
pkgname=$_pkgname
pkgver=0.19.0
pkgrel=2
pkgdesc='Fuzzy string matching in Python'
arch=(any)
_url="https://pypi.python.org/pypi/thefuzz"
url="https://github.com/seatgeek/thefuzz"
license=('GPL2')
depends=(
  'python-levenshtein'
)
provides=(${_pkgname})
conflicts=(${provides[@]})
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-hypothesis'
  'python-pycodestyle'
  'python-pytest'
)
source=("$_pkgname"::"git+$url#tag=$pkgver")
sha256sums=(SKIP)

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

check() {
  cd "$srcdir/$_pkgname"
  pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    dist/*.whl
}
