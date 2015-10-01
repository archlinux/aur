# Maintainer: Carl George < arch at cgtx dot us >

_name="extras"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.0.3"
pkgrel="4"
pkgdesc="Useful extra bits for Python - things that shold be in the standard library"
arch=("any")
url="https://github.com/testing-cabal/${_name}"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7a60d84cb661b477c41a5ea35e931ae93860af8cd259ecc0a38a32ef1ae9ffc0')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-extras() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-extras() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
