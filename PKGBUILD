# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="strobe-ops"
pkgname="strobengine"
pkgver=0.8.1
pkgrel=1
pkgdesc="A high-performance HTTP load testing engine with a Python API and a bare-metal Rust core"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('Apache-2.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'cargo')
depends=('glibc' 'libgcc' 'python' 'python-rich' 'python-typer' 'python-jinja')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6f8baa48d417d6c421799bf23171cbb7dfb91b3b1ef1f6348dde5325644c6af')

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
