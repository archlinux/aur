# Maintainer: Carl George < arch at cgtx dot us >

_name="GitPython"
_module="git"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.0.6"
pkgrel="1"
pkgdesc="Python Git Library"
arch=("any")
url="https://github.com/gitpython-developers/${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('282268c4eab0d53a44fe40af038625be307560370c38d2882f3b6763642785db')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-git() {
    depends=("git>=1.7" "python-gitdb>=0.6.4")
    provides=("python-gitpython=${pkgver}-${pkgrel}")
    conflicts=("python-gitpython")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-git() {
    depends=("git>=1.7" "python2-gitdb>=0.6.4")
    provides=("python2-gitpython=${pkgver}-${pkgrel}")
    conflicts=("python2-gitpython")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
