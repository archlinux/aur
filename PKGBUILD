# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-emmet-core
_pkgname=emmet-core
_pypiname=emmet_core
pkgver=0.87.2
pkgrel=1
pkgdesc="Core data models for the Materials Project emmet data pipeline"
arch=('any')
url="https://github.com/materialsproject/emmet"
license=('custom')
depends=(
    'python'
    'python-monty'
    'python-pydantic'
    'python-pydantic-settings'
    'python-typing_extensions'
    'python-inflect'

    'python-pymatgen-core'
)
optdepends=(
    'python-pybtex: BibTeX support (install via pip)'
    'python-blake3: hashing (install via pip)'
    'python-pubchempy: PubChem lookups (install via pip)'
    'python-pymatgen-io-validation: I/O validation (install via pip)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
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

    # License from the emmet monorepo
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    fi
}
