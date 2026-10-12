# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-pipelex-tools"
pkgver=0.5.0
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
sha256sums=('ebeba322f1ce27680adf7976c374103414710b868107a08051a50f186eb59fa3')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
