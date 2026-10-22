# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name=gds2palace
pkgname=python-${_name}
pkgver=0.9.1
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
source=("${_name}::git+${url}#commit=f76f33acf4a337c656c74bd015f8fcb5da973770")
b2sums=("SKIP")

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
