# Maintainer: Eric Fung <loseurmarbles at gmail dot com>
pkgname=python-collections-extended
_pkgname=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc='Extra Python Collections - bags(multiset), setlists, RangedMap and IndexedDict'
arch=('any')
url='https://github.com/mlenzen/collections-extended'
license=('APACHE')
makedepends=('python-poetry')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93d3aa1d19f644d2478da870cea3fd6a3796be212636fc1d125036609c6d5adf')

build() {
    cd "${_pkgname}-${pkgver}"
    /usr/bin/poetry build

    cd dist
    tar -xzf "${_pkgname}-${pkgver}.tar.gz"
}

package() {
    cd "${_pkgname}-${pkgver}/dist/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
