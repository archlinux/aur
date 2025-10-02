# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=python-kenobi
pkgver=4.0
pkgrel=1
pkgdesc='A document based database using SQLite'
url="https://patx.github.io/kenobi/"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("git+https://github.com/patx/kenobi.git#tag=v$pkgver")
sha256sums=('924af436a4d972836f90f3b08dbeab84be68ee210663d8cf7dba07ac96d6bd76')

build() {
    cd "kenobi"
    python -m build --wheel --no-isolation
}

check() {
    cd "kenobi"
    pytest tests.py -v
}

package() {
    cd "kenobi"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
