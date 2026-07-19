# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="1mystic"
pkgname="plumefile"
pkgver=0.1.1
pkgrel=1
pkgdesc="A command-line file-sharing tool that scans a file before it flies: secrets, PII, a data profile and sentiment, then a self-destructing LAN or tunnel link"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}" "${_pypi_package%file}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-fastapi' 'python-pandas' 'python-qrcode' 'python-httpx' 'python-rich' 'python-typer' 'python-vadersentiment' 'uvicorn')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c2e6367c8c8cfb9c814346fe801eeb19f5f8eb5a5dde5eec2361bbc291a0e71')

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
