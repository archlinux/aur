# Maintainer: Carl George < arch at cgtx dot us >

_name="GitPython"
_module="git"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.2"
pkgrel="1"
pkgdesc="Python Git Library"
arch=("any")
url="https://github.com/gitpython-developers/${_name}"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('85de72556781480a38897a77de5b458ae3838b0fd589593679a1b5f34d181d84')

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
