# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-opr"
pkgver=0.6
pkgrel=1
pkgdesc="OPR: Optimized Primer"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url='https://github.com/openscilab/opr'

depends=('python')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c84d7f7493a09310830b73f6a46ce650702f6f8e794ae88720d40b1536cf219e')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AUTHORS.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
