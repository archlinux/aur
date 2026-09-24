# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-pymatgen-core
_pkgname=pymatgen-core
_pypiname=pymatgen_core
pkgver=2026.9.23
pkgrel=1
pkgdesc="Core modules of the Python Materials Genomics library for materials analysis"
arch=('x86_64')
url="https://github.com/materialsproject/pymatgen-core"
license=('MIT')
depends=(
    'python'
    'python-monty'
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
    'python-sympy'
    'python-pandas'
    'python-networkx'
    'python-requests'
    'python-tabulate'
    'python-tqdm'
    'python-uncertainties'
    'python-plotly'
    'python-lxml'
    'python-orjson'
    'python-joblib'
    'python-bibtexparser'

)
optdepends=(
    'python-spglib: space group analysis (install via pip)'
    'python-palettable: color palettes (install via pip)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
    'cython'
    'python-numpy'
)
source=("${_pypiname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${_pypiname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pypiname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
