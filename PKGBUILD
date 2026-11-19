# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=gds2palace
pkgname=python-${_name}
pkgver=0.11.0
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
b2sums=('ecaa35630f4b6ab8f1a248241b56207bf4bf6d2b34b7dee8b5e82d7c2b026aea50aa304bd9511897978e978f7217d5e0ff8efd811b00921fd1f5b5be9143e4dd')

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
