# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.6.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='cocode'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A powerful command-line tool for analyzing and processing code repositories"
arch=('any')
url='https://github.com/Pipelex/cocode'
license=('MIT')

provides=("${_pypi_package}")
makedepends=('python' 'python-click' 'python-rich' 'python-typer' 'python-typing_extensions' 'python-pygithub' 'python-pydantic' 'python-pathspec' 'pipelex')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a783be4e47074cb3549dd5a33a51f84b0bfd04da1e279cbb980eab1c5ab8632b')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "AGENTS.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
    install -Dm644 "CLAUDE.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
    install -Dm644 "CLI_README.md" "${pkgdir}/usr/share/doc/${pkgname}/CLI_README.md"
    install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
    install -Dm644 "BLACKBOX_RULES.md" "${pkgdir}/usr/share/doc/${pkgname}/BLACKBOX_RULES.md"
    install -Dm644 "CODE_OF_CONDUCT.md" "${pkgdir}/usr/share/doc/${pkgname}/CODE_OF_CONDUCT.md"
}
