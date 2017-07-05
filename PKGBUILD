# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: fclad <fcladera at fcladera.com>

_pkgname=python-plotly
_pypiname=plotly
pkgbase=python-plotly
pkgname=('python-plotly' 'python2-plotly')
pkgver=2.0.12
pkgrel=1
url="https://plot.ly/python/"
license=('MIT')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "LICENSE")
sha512sums=('0570ba9e329b8f0582451b33c618c48e96404a06e7c6ea5b0b65e56d0e9ba63f744fec8d33de25bfcf429c8f85c01050e7c6943534f725d02f94fce43e8c90a3'
            '1f27d546f594955e443a3d8a72aa4f18afa9d946336a9fd0585de3c8120e3ef262ce109eea0ee8d97510616864b8d01f8e4d48ebc0fc1486fd490bf8ba3a7f89')
#validpgpkeys=('') # TODO https://github.com/plotly/plotly.py/issues/764

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pypiname}-${pkgver}" "python2-${_pypiname}-${pkgver}"
}

package_python-plotly() {
    pkgdesc="An interactive, browser-based graphing library for Python3"
    depends=('python' 'python-requests' 'python-pytz' 'python-six'
    'python-numpy')

    cd "${srcdir}/${_pypiname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-plotly() {
    pkgdesc="An interactive, browser-based graphing library for Python2"
    depends=('python2' 'python2-requests' 'python2-pytz' 'python2-six'
    'python2-numpy')

    cd "${srcdir}/python2-${_pypiname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
