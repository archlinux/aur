# Maintainer: Carl George < arch at cgtx dot us >

_name="pluginbase"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.3"
pkgrel="3"
pkgdesc="A support library for building plugins sytems in Python."
arch=("any")
url="http://pluginbase.pocoo.org/"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d9486a2d50017551c3f0e474648b71ea2e39429720977119a437713ebae2257f')

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
