# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='typio'
_pkgauthor='sepandhaghighi'
pkgname="python-${_pkgname}"
pkgver=1.3
pkgrel=1
pkgdesc="Make Your Terminal Type Like a Human"

arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

optdepends=()
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f28d9a51599e9275166acabceac2c34ae8f3cd0943177509e414e3c961ad7acb')

_pypi_package=${_pkgname}
_pypi_version=${pkgver}


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
