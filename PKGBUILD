# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>
_name=autoflake
pkgname=python-autoflake
pkgver=2.0.0
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
sha256sums=('b8b945a9adf5c8231f49fde2c1422e3618af4826825f6f8033e29434c71bf1bc')

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
