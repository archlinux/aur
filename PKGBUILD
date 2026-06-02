# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-diwire"
pkgver=1.4.1
pkgrel=1
pkgdesc="A lightweight, type-safe dependency injection container with automatic wiring, scoped lifetimes, and zero dependencies"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
url='https://github.com/maksimzayats/diwire'
license=('MIT')

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-pydantic' 'python-pydantic-settings' 'python-fastapi' 'python-typing_extensions' 'python-pytest')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('bd3019548125524d752d2f51cf67512a5873095d9e495301c52e0c8678bb97c4')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
