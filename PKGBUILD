# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code@nuew.net>
_name=maseya-z3pr
pkgname="python-${_name}"
pkgver='1.0.0.rc1'
pkgrel=1
pkgdesc="Zelda 3 Palette Randomizer"
arch=(any)
url="https://github.com/maseya/z3pr-py"
license=(LGPL-3.0-or-later)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('24a7212fa6b0f0be84c40282dcdef8e92d869d6aeff4c9081d723b048d210af4')

build() {
    cd "${_name#maseya-}-py-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name#maseya-}-py-${pkgver}"
    PYTHONPATH="${PWD}/build/lib" pytest "${pytest_options[@]}"
}

package() {
    cd "${_name#maseya-}-py-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
