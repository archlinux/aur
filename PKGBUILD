# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='samila'
_pkgauthor='sepandhaghighi'
pkgname="python-${_pkgname}"
pkgver=1.6
pkgrel=1
pkgdesc="A Generative Art Generator"

arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

optdepends=()
depends=('python' 'python-art' 'python-matplotlib' 'python-pillow')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b8fc75ca8204bdcc765a2e18486f2b9fe1956ca21150f52452288df09ff073cd')

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
