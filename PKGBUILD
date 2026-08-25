# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-mthds"
pkgver=0.8.2
pkgrel=1
pkgdesc="The Python interface for methods — base structures for structured outputs and the base runner for executing methods via API"

arch=('any')
license=('MIT')
url='https://pypi.org/project/mthds/'

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-semantic-version' 'python-pydantic' 'python-pydantic-core' 'python-tomlkit' 'python-httpx' 'python-typing_extensions')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ac24a415f5a4942e93309066ed6b65a553ca379578e2da93f492bc63342b0b6')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
