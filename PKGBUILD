# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='diwire'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A lightweight, type-safe dependency injection container with automatic wiring, scoped lifetimes, and zero dependencies"

arch=('any')
url='https://github.com/maksimzayats/diwire'
license=('MIT')

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-pydantic' 'python-pydantic-settings' 'python-fastapi' 'python-typing_extensions' 'python-pytest')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c14ecad52243b27289d434d62f3b64b235dea47f461385dfd126b93932822d04')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
