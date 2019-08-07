# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: fclad <fcladera at fcladera.com>

_pkgname=python-plotly
_pypiname=plotly
pkgbase=python-plotly
pkgname=('python-plotly' 'python2-plotly')
pkgdesc="An interactive, browser-based graphing library for Python"
pkgver=4.1.0
pkgrel=1
url="https://plot.ly/python/"
license=('MIT')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools' 'python-numpy' 'python-pytz' 'python-requests' 'python-retrying' 'python2-numpy' 'python2-pytz' 'python2-requests')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('b7249ce8acc98d642ede4eec3f18cdd251969d8da9a1dba467afed40d84b568ac2f3c8471bb98b386dde82d027c1f9f03cdab6d8271fa85349a428f1a507dde1')
#validpgpkeys=('') # TODO https://github.com/plotly/plotly.py/issues/764

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pypiname}-${pkgver}" "python2-${_pypiname}-${pkgver}"
}

package_python-plotly() {
    pkgdesc="An interactive, browser-based graphing library for Python3"
    depends=('python' 'python-requests' 'python-pytz' 'python-six'
    'python-numpy' 'python-retrying')

    cd "${srcdir}/${_pypiname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "${srcdir}/${_pypiname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-plotly() {
    pkgdesc="An interactive, browser-based graphing library for Python2"
    depends=('python2' 'python2-requests' 'python2-pytz' 'python2-six'
    'python2-numpy' 'python-retrying')

    cd "${srcdir}/python2-${_pypiname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 "${srcdir}/python2-${_pypiname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
