# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>

_name="gds2openems"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.5.0.r35.g0f87e9d
pkgrel=1
pkgdesc='GDSII to openEMS workflow and scripts'
arch=(any)
url=https://github.com/VolkerMuehlhaus/gds2openEMS
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-numpy'
    'python-openems'
    'python-csxcad'
    'python-gdspy'
    'python-shapely'
    'pyside6'
    'shiboken6'
)
makedepends=(
    'git'
    'python-build'
    'python-wheel'
    'python-installer'
    'python-setuptools'
)
checkdepends=()
optdepends=(
    'python-easymesh4openems: Alternative mesher'
)
source=("${_name}::git+${url}")
b2sums=("SKIP")
provides=("${pkgname%%-git}")

pkgver() {
    cd "${_name}"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: set ts=4 sw=4 et:
