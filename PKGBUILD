# Maintainer: Carl George < arch at cgtx dot us >

_name="apache-libcloud"
_module="${_name#apache-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.19.0"
pkgrel="1"
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs."
arch=("any")
url="https://libcloud.apache.org"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.bz2")
sha256sums=('419f524d6a9d1d3af6f7c8db8fb1257b7de870f2772bcc15dacae8cd1b877788')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-libcloud() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-libcloud() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
