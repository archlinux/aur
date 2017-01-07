# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Erik Johnson <palehose at gmail dot com>

pkgbase="ptpython"
pkgname=("ptpython" "ptpython2")
pkgver="0.36"
pkgrel="2"
pkgdesc="Python REPL build on top of prompt_toolkit"
arch=("any")
url="https://github.com/jonathanslenders/ptpython"
license=("BSD")
makedepends=(
    "python-setuptools"
    "python2-setuptools"
)
source=("https://files.pythonhosted.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('a84b6398962a92e07a33891c4eae821173fb4c03a4d403b1b099edf370c86d53')

prepare() {
    cp -a "${srcdir}/${pkgbase}-${pkgver}" "${srcdir}/${pkgbase}2-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${pkgbase}2-${pkgver}"
    python2 setup.py build
}

package_ptpython() {
    depends=(
        "python-docopt"
        "python-jedi>=0.9.0"
        "python-prompt_toolkit>=1.0.0"
        "python-pygments"
    )
    optdepends=(
        "ipython: ptipython (ptpython + ipython)"
    )
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ptpython2() {
    depends=(
        "python2-docopt"
        "python2-jedi>=0.9.0"
        "python2-prompt_toolkit>=1.0.0"
        "python2-pygments"
    )
    optdepends=(
        "ipython2: ptipython2 (ptpython2 + ipython2)"
    )
    cd "${srcdir}/${pkgbase}2-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/bin/ptpython"
    rm "${pkgdir}/usr/bin/ptipython"
}
