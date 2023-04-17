# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Andrea Orru <andrea at orru dot io>
# Python package author: Steven Myint <UNKNOWN>

pkgname=python-autoflake
_pkgname="${pkgname#python-}"
pkgver=2.1.0
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
sha256sums=('f4ae7902d723f226a2c9654e907cc4534e3ca8e9f0ef4f9baa8cc64e6ecca643')

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
