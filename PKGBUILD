# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="leolaurindo"
pkgname="chess-analyzer-tui"
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight chess.com-style analyzer. Runs with any UCI engine. Gets game from file, stdin or clipboard."

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package%-tui}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('bash' 'stockfish' 'python' 'python-pyperclip' 'python-platformdirs' 'python-textual' 'python-rich' 'python-chess')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1f44151c673ecd05dec925c7e5a396bd14d775d92a0294774d45fa12e9f5dbe')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
