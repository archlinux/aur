#  Maintainer: Jacob S. Gordon <jacob.as.gordon@gmail.com
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=1.1.3
_pkgdir="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-setuptools)
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6f1f0a9d0e34e07f1ddc9f7f50a6e045014f3628d4adc8555a06749a533147530f2145425aab319dccad59a6375eb99c4fb5f4910d3686e407d5226ba531d45f')

build() {
    cd "${srcdir}/${_pkgdir}"
    export PYTHONHASHSEED=0
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgdir}"
    python tests.py
}

package() {
    cd ${pkgname}-${pkgver}
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" \
                       python setup.py install \
                       --prefix=/usr --root="${pkgdir}" \
                       --optimize=1 --skip-build
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
