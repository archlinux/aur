# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>

pkgname=python-pyxtal
_pkgname=PyXtal
pkgver=1.1.5
pkgrel=1
pkgdesc="Python code for generation of crystal structures based on symmetry constraints"
arch=('any')
url="https://github.com/MaterSim/PyXtal"
license=('MIT')
depends=(
    'python>=3.9'
    'spglib'
    'python-pymatgen-core'
    'python-pandas'
    'python-networkx'
    'python-ase'
    'python-scipy'
    'python-importlib-metadata'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-juliacall: Julia integration for OCSE'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MaterSim/PyXtal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b51ab8dd3238c97687a33e07c2d7660abfb19d4f9bc339aed5e9583267561b16')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i 's/setup_requires=\["juliacall>=0.9.0"\]/setup_requires=[]/' setup.py
}

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
