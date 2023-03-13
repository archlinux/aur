# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>
_name=autoflake
pkgname=python-autoflake
pkgver=2.0.2
pkgrel=1
pkgdesc='Removes unused imports and unused variables'
arch=(any)
url="https://github.com/myint/$_name"
license=("MIT")
depends=(
    'python'
    'python-pyflakes'
    # required for python<3.11
    'python-tomli'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-pytest'
)
source=("https://github.com/myint/$_name/archive/v${pkgver}.tar.gz")
sha256sums=('90fc6f7135047ba523d86d69860b8f63c7fd099f67b369f1d5dce39253ec09b1')

build() {
  pwd
  ls -lah
  cd "$srcdir/$_name-$pkgver"
  python -m build -nw
}

check() {
  cd "$srcdir/$_name-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer -d "$pkgdir" dist/*.whl
}
