# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>

_name="livereload"
_module="${_name}"
_cmd="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver=2.5.0
pkgrel=1
pkgdesc="An awesome tool for web developers."
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bc708b46e22dff243c02e709c636ffeb8a64cdd019c95a215304e6ce183c4859')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-livereload() {
    depends=("python-six" "python-tornado")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-livereload() {
    depends=("python2-six" "python2-tornado")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}-python2"
}
