# Maintainer: Carl George < arch at cgtx dot us >

_name="smmap2"
_module="${_name%2}"

pkgname=("python-${_name}" "python2-${_name}")
pkgver="2.0.1"
pkgrel="4"
pkgdesc="a pure-Python git object database"
arch=("any")
url="https://github.com/gitpython-developers/${_module}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/gitpython-developers/smmap/v${pkgver}/LICENSE")
sha256sums=('5c9fd3ac4a30b85d041a8bd3779e16aa704a161991e74b9a46692bc368e68752'
            '88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-smmap2() {
    depends=("python")
    conflicts=("python-smmap")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-smmap2() {
    depends=("python2")
    conflicts=("python2-smmap")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
