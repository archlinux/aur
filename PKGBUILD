# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_pymodule=viivakoodi
pkgbase=python-${_pymodule}
pkgname=("python2-${_pymodule}" "python-${_pymodule}")
pkgver=0.8.0
pkgrel=5
pkgdesc='Barcode generator for Python. Fork of pyBarcode project.'
arch=('any')
url="https://github.com/kxepal/${_pymodule}"
license=('MIT')
source=("${_pymodule}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e1a17dc24975d5242202cfbb7534d69dd14eeb26bdf8a10f056c7b04904fef1e')
makedepends=('python-setuptools'
             'python2-setuptools')
checkdepends=('python-pytest'
              'python-mock'
              'python-tox'
              'python2-pytest'
              'python2-mock'
              'python2-tox')
check() {
    cd "${srcdir}/${_pymodule}-${pkgver}"

    for py_int in python3 python2; do
        msg "Testing ${_pymodule}-${pkgver} with ${py_int}"
        "${py_int}" ./test.py
    done
}

build() {
    cd "${srcdir}/${_pymodule}-${pkgver}"

    python setup.py build
    python2 setup.py build
}

package_python-viivakoodi() {
    depends=('python-setuptools')
    optdepends=('python-pillow: render barcodes as images')

    cd "${srcdir}/${_pymodule}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.launcher"
}

package_python2-viivakoodi() {
    depends=('python2-setuptools')
    optdepends=('python2-pillow: render barcodes as images')

    cd "${srcdir}/${_pymodule}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.launcher"
}
