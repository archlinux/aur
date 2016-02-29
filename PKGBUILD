# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Erik Johnson <palehose at gmail dot com>

pkgbase="ptpython"
pkgname=("ptpython" "ptpython2")
pkgver="0.30"
pkgrel="1"
pkgdesc="Python REPL build on top of prompt_toolkit"
arch=("any")
url="https://github.com/jonathanslenders/ptpython"
license=("BSD")
makedepends=(
    "python-setuptools"
    "python2-setuptools"
)
source=("https://pypi.python.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('50efef571dbfc12c2b33c0b9ac29407e380ffb9dda948a0650aa382588736e72')

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
        "python-prompt_toolkit=0.59"
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
        "python2-prompt_toolkit=0.59"
        "python2-pygments"
    )
    optdepends=(
        "ipython2: ptipython2 (ptpython2 + ipython2)"
    )
    cd "${srcdir}/${pkgbase}2-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${pkgdir}/usr/bin"
    mv ptpython{,2}
    mv ptipython{,2}
}
