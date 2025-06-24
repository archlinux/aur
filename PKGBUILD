# Maintainer: Daringcuteseal <daringcuteseal@gmail.com>
pkgname=python-decli
pkgver=0.6.3
pkgrel=1
pkgdesc="Minimal, easy to use, declarative command line interface tool"
arch=('any')
url="https://github.com/Woile/decli"
license=('MIT')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('72a5f2672ceaa831c84019f3e1a90bc463afa49599ffb417e813f8dfdb04c9ad')

_pkgname="${pkgname/python-/}"

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  py.test -vvv tests/
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
