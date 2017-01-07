# Maintainer: Carl George < arch at cgtx dot us >

_name="pluginbase"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.5"
pkgrel="2"
pkgdesc="A support library for building plugins sytems in Python."
arch=("any")
url="http://pluginbase.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b4f830242a078a4f44c978a84f3365bba4d008fdd71a591c71447f4df35354dd')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-pluginbase() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-pluginbase() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
