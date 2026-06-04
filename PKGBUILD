# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='pyrgg'
_pkgauthor='sepandhaghighi'
pkgname="python-${_pkgname}"
pkgver=2.0
pkgrel=1
pkgdesc="A Random Graph Generator"

arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

optdepends=()
depends=('python' 'python-art' 'python-yaml')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('989019b582dddb0b52baeee84417984f80d781f1211947c7f560be0af1539f4a')

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
