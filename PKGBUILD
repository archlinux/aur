# Maintainer: Carl George < arch at cgtx dot us >

_name="github3.py"
_module="${_name%.py}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.9.6"
pkgrel="1"
pkgdesc="Python wrapper for the GitHub API"
arch=("any")
url="https://github.com/sigmavirus24/github3.py"
license=("BSD")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b831db85d7ff4a99d6f4e8368918095afeea10f0ec50798f9a937c830ab41dc5')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -e 's/\(uritemplate\).py/\1/' -i setup.py
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    python2 setup.py build
}

package_python-github3() {
    depends=("python-requests>=2.0" "python-uritemplate>=0.2.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-github3() {
    depends=("python2-requests>=2.0" "python2-uritemplate>=0.2.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
