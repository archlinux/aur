# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot4
pkgname=(python-uproot4)
_pkgname=uproot4
pkgver=4.0.2rc1
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pkgconfig' 'python-pandas' 'python-pytest-runner' 'python-requests' 'python-xxhash')
depends=('python-awkward' 'python-cachetools' 'python-lz4' 'python-numpy' 'python-zstandard')
optdepends=('xrootd: access remote files over XRootD'
            'python-pandas: fill Pandas DataFrames instead of Numpy arrays'
            'python-requests: access remote files through HTTP'
            'python-xxhash: handle lz4-compressed ROOT files')
url="https://github.com/scikit-hep/${_pkgname}"
license=('BSD')
conflicts=('python-uproot')

source=("${_pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0379bfcff1956cdee80fe3d6f93abb8b42a578ce0653989d9dad284fa7340963')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py pytest
}

package_python-uproot4() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
