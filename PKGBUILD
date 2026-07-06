# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="cocode"
pkgver=0.8.0
pkgrel=1
pkgdesc="A powerful command-line tool for analyzing and processing code repositories"

arch=('any')
license=('MIT')
url='https://github.com/Pipelex/cocode'

_pypi_package=${pkgname}
_pypi_version=${pkgver}

provides=("${_pypi_package}")
makedepends=('python' 'python-click' 'python-rich' 'python-typer' 'python-typing_extensions' 'python-pygithub' 'python-pydantic' 'python-pathspec' 'pipelex')

source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('16891836b1bdbe398ca8fda671e1793c9b192e794f86eedadeb12225da0cf4e3')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "CLA.md" "${pkgdir}/usr/share/doc/${pkgname}/CLA.md"
    install -Dm644 "CLAUDE.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
    install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 "CLI_README.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI_README.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
