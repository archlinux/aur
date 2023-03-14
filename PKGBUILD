# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

_pkgname=python-thefuzz
pkgname=$_pkgname-git
pkgver=0.19.0.r29.g04deff5
pkgrel=1
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
source=("$_pkgname"::"git+$url")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
