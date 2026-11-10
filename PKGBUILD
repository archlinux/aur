# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=gds2palace
pkgname=python-${_name}
pkgver=0.10.0
pkgrel=1
pkgdesc="Create AWS Palace (FEM Solver) model from GDSII layout files"
arch=(any)
url=https://github.com/VolkerMuehlhaus/gds2palace_ihp_sg13g2
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-gdspy'
    'python-shapely'
    'python-numpy'
    'gmsh'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
optdepends=(
    'python-matplotlib: If running the inductor synthesis example'
    'python-scikit-rf: For converting output to Touchstone'
    'paraview: To view field-dump output'
    'palace: Primary FEM solver'
    'elmerfem: Alternative FEM solver'
)

# FIXME: v0.9.1 isn't tagged, use the commit directly)
source=("${_name}::git+${url}#tag=v${pkgver}")
b2sums=('79b6d5db36ea78636b43643dc9a010d39da2b12ae417e7bd12709158597d74a6d57345d458b7c1814a3418f0f9b90c7430616e04db57cf8a3c7c1e5197b1a2e5')

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
