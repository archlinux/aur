# Maintainer: Carl George < arch at cgtx dot us >

_name="cliff-tablib"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.0"
pkgrel="2"
pkgdesc="tablib formatters for cliff"
arch=("any")
url="https://github.com/dreamhost/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6d32b34897be2defb8b2add09404313e36f7aa52f41a977cd201abafc518a2f7')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-cliff-tablib() {
    depends=("python-cliff" "python-tablib")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-cliff-tablib() {
    depends=("python2-cliff" "python2-tablib")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
