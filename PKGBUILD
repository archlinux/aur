# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=gds2palace
pkgname=python-${_name}
pkgver=0.10.4
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
b2sums=('0d9bb97f93f1edf80e13ed847cf072f538dfcb3cdeb7149d1493789eec2508bfdc7d402d348a08ab3f5bf20fff27ca4a666a6bef773351e538df16c2cc6714cd')

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
