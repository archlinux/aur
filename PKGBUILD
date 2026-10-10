# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="leolaurindo"
pkgname="chess-analyzer-tui"
pkgver=0.2.3
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
sha256sums=('739aab668d468c4b36e9b0024d0c4468a83216a2f1aa1e1f18f0b58069daa3a0')

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
