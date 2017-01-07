# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: valère monseur <valere dot monseur at ymail dot com>

_name="livereload"
_module="${_name}"
_cmd="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.5.1"
pkgrel="1"
pkgdesc="An awesome tool for web developers."
arch=("any")
url="https://github.com/lepture/python-livereload"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('422de10d7ea9467a1ba27cbaffa84c74b809d96fb1598d9de4b9b676adf35e2c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
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
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}-python2"
}
