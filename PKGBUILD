# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: fclad <fcladera at fcladera.com>

_pkgname=python-plotly
_pypiname=plotly
pkgbase=python-plotly
pkgname=('python-plotly' 'python2-plotly')
pkgver=2.0.11
pkgrel=1
url="https://plot.ly/python/"
license=('MIT')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
        "LICENSE")
sha512sums=('6fd89d962fc73d365b189788132c2a6fe7fc35454fb1086a659a87ec5acc3778adcec0025b0c5c864627365a5aee334c8f0c65ca746ca5705375d7a84b980d91'
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
