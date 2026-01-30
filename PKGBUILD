# SPDX-License-Identifier: 0BSD
# Maintainer: Emma Welker <code at nuew dot net>
_name=pyevermizer
pkgname="python-${_name}"
pkgver=0.50.1
_evermizerver=0${pkgver#0.}
pkgrel=1
pkgdesc="python wrapper for the Secret of Evermore randomizer 'evermizer'"
arch=(x86_64)
url='https://github.com/black-sliver/pyevermizer'
_evermizerurl='https://github.com/black-sliver/evermizer'
license=(GPL-3.0-only LGPL-3.0-only)
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("evermizer-${pkgver}.tar.gz::${_evermizerurl}/archive/v${_evermizerver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c57bafcde45fc4d38eb219dee3daf4da3e3b89326c7ad4dac35a42203e9c7f53'
            '61588beb4f27c0092990e3902514947ec3a7185f0187e36203cbf54185bf62f1')

prepare() {
    rmdir "${_name}-${pkgver}/src/evermizer"
    mv "evermizer-${_evermizerver}" "${_name}-${pkgver}/src/evermizer"
}

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
