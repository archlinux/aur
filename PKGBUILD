# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-uproot
_pkgname=uproot
pkgname=python-uproot
pkgver=3.10.6
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('python-cachetools' 'python-setuptools')
checkdepends=('python-mock' 'python-pkgconfig' 'python-pytest-runner' 'python-requests' 'python-xxhash')
depends=('python-awkward' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-uproot-methods')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/uproot"
license=('BSD')

source=("${url}/archive/${pkgver}.zip")
sha256sums=('1c3b5fd7f966f20cb50b175371037cda8b8326ca316541de4ae9d1c33a3c83b3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
