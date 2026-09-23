# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="pipelex-tools"
pkgver=0.9.0
pkgrel=1
pkgdesc="MTHDS/TOML formatter, linter, and LSP"

arch=('any')
license=('MIT')
url='https://github.com/Pipelex/pipelex'

_pypi_package=${pkgname}
_pypi_version=${pkgver}

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling' 'python-maturin' 'cargo')
optdepends=('python-pipelex-tools')
depends=('glibc' 'libgcc')
provides=("plxt")

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bcafef2a30ed06aff4e131892151dd389a271897634d7fd6a410c3e0b50fd196')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "docs/pipelex/PYPI_README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
