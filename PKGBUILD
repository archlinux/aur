# Maintainer: Carl George < arch at cgtx dot us >

_name="click"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="4.1"
pkgrel="1"
pkgdesc="A simple wrapper around optparse for powerful command line utilities."
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
checkdepends=("python-pytest" "python2-pytest")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e339ed09f25e2145314c902a870bc959adcb25653a2bd5cc1b48d9f56edf8ed8')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py test
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py test
}

package_python-click() {
    depends=("python>=3.3")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-click() {
    depends=("python2>=2.6")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
