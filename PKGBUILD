# Maintainer: Carl George < arch at cgtx dot us >

_name="unicodecsv"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.14.0"
pkgrel="1"
pkgdesc="Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*."
arch=("any")
url="https://github.com/jdunck/python-${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jdunck/python-unicodecsv/master/LICENSE")
sha256sums=('495871db660eb0519e351cbbac02996448071e726b2523d4e01bc51ecb8c7795'
            'a3b3fcd3f2b3e97b4c4ffc354f719e1519dc95dc0b09d82f769538feeb7db032')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-unicodecsv() {
    depends=("python")
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-unicodecsv() {
    depends=("python2")
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
