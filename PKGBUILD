# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-dara-xrd
_pkgname=dara_xrd
pkgver=1.3.0
pkgrel=1
pkgdesc="Data-driven Automated Rietveld Analysis for powder XRD phase search and refinement"
arch=('any')
url="https://github.com/CederGroupHub/dara"
license=('MIT')
depends=(
    'python-pymatgen-core'
    'python-mp-api'
    'spglib'
    'python-plotly'
    'python-toml'
    'python-scikit-learn'
    'python-pydantic'
    'python-pydantic-settings'
    'python-fastapi'
    'uvicorn'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-git-versioning'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1ddf23e2b2794c20d7a284c7e17af2066f1fa89413681f8a8dfaf17e49af32ee')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
