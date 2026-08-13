# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="strobe-ops"
pkgname="strobengine"
pkgver=0.2.1
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
sha256sums=('1dd08a25eeca3e914cc6552673d0f7fad48611aee4ef6b0ac6f017b9ca55e3c2')

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
