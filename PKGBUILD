# Maintainer: Carl George < arch at cgtx dot us >

_name="apache-libcloud"
_module="${_name#apache-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A standard Python library that abstracts away differences among multiple cloud provider APIs."
arch=("any")
url="https://libcloud.apache.org"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a04278781250fbb7d448203daedb4a3428183ef05b4d72cbbf28971775404df2')

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
