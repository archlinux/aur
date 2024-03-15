# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>

pkgname=python-autoflake
_pkgname="${pkgname#python-}"
pkgver=2.3.1
pkgrel=2
pkgdesc='Removes unused imports and unused variables'
arch=(any)
url="https://github.com/PyCQA/autoflake"
license=("MIT")
depends=(
    'python'
    'python-pyflakes'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PyCQA/autoflake/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1b3c651efcd005d602fe16a9c69c011a11bcd189cfc1880128fee39fd009ac0')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build -nw
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
