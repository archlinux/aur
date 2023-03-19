# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=procal-git
pkgver=3617a5b9

pkgrel=1
pkgdesc='Simple Qt-based programming calculator'
arch=('x86_64')
url='https://github.com/joajfreitas/procal'
license=('GPLv3')
depends=('python' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyqtdarktheme')
optdepends=()
makedepends=(python-build python-installer python-wheel)
provides=('procal')
_pkgname=procal
source=("${_pkgname}::git+https://github.com/joajfreitas/procal#commit=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git rev-parse HEAD | head -c8)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

