# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-mp-api
_pkgname=api
pkgver=0.47.0
pkgrel=1
pkgdesc="Materials Project API client for accessing materials data"
arch=('any')
url="https://github.com/materialsproject/api"
license=('BSD-3-Clause')
depends=(
    'python>=3.10'
    'python-pymatgen-core'
    'python-emmet-core'
    'python-monty'
    'python-requests'
    'python-boto3'
    'python-pyarrow'
    'python-orjson'
    'python-rich'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-uv-dynamic-versioning'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/materialsproject/api/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4d37894a198113fab93761a07e24439e64c86dbec471d078ab2a24d8696b1dfa')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
