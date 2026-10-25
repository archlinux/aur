# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-pipelex-tools"
pkgver=0.7.0
pkgrel=1
pkgdesc="Pipelex Tools as a Python library — MTHDS lint & format, importable as 'pipelex_tools'"

arch=('any')
license=('MIT')
url='https://pypi.org/project/pipelex-tools-py/'

_pypi_package=${pkgname#python-}-py
_pypi_version=${pkgver}

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling' 'python-maturin' 'cargo')
depends=('glibc' 'libgcc')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('88ca50b17f02939a2890b80d0b5b091ef390d5fe138d4eeb6bb4cf840c9243bd')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
