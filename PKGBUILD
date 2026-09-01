# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="strobe-ops"
pkgname="strobengine"
pkgver=0.5.1
pkgrel=1
pkgdesc="A high-performance HTTP load testing engine with a Python API and a bare-metal Rust core"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('Apache-2.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'cargo')
depends=('glibc' 'libgcc' 'python' 'python-rich' 'python-typer')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5da5930ff74dabe3b686adb16ff59ddf375916227002bdb9023f956d69eb5cb8')

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
