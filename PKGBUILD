# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-mthds"
pkgver=0.14.0
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
sha256sums=('d2b4a9cd064004dfd5b802bb71c9894601fba9e598426f96e4bede16d52c3900')

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
