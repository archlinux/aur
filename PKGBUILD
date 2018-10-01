# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: fclad <fcladera at fcladera.com>

_pkgname=python-plotly
_pypiname=plotly
pkgbase=python-plotly
pkgname=('python-plotly' 'python2-plotly')
pkgdesc="An interactive, browser-based graphing library for Python"
pkgver=3.3.0
pkgrel=1
url="https://plot.ly/python/"
license=('MIT')
arch=("any")
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('9198673b268ab4e1fec25b46399e3af59e403a3aa0fb9063330d34e0b3179cedc61351f95f791c72cb80b62e4eb3521f8e7a8e03be7fcc5ae9c343a979468084')
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
