# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>

pkgname=python-autoflake
_pkgname="${pkgname#python-}"
pkgver=2.1.1
pkgrel=1
pkgdesc='Removes unused imports and unused variables'
arch=(any)
url="https://github.com/PyCQA/autoflake"
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
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PyCQA/autoflake/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0cf9b50f73cb9e07435ff2c14e3bc918092238f5fecca56bc628301224d350fb')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build -nw
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
