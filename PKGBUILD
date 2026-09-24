# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-quacc
_pkgname=quacc
pkgver=1.5.13
pkgrel=1
pkgdesc="A platform for high-throughput, database-driven quantum chemistry and computational materials science"
arch=('any')
url="https://github.com/Quantum-Accelerators/quacc"
license=('BSD-3-Clause')
depends=(
    'python>=3.11'
    'python-numpy'
    'python-psutil'
    'python-pydantic'
    'python-pydantic-settings'
    'python-ruamel-yaml'
    'python-typer'
    'python-frozendict'
    'python-ase'
    'python-custodian'
    'python-pymatgen-core'
    'python-emmet-core'
    'python-monty'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Quantum-Accelerators/quacc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('66d8d70698eba3110373eaf36fbd85522f84df4ecc9790c16b93bb93af23c346')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
