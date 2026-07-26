# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-diwire"
pkgver=1.4.3
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
sha256sums=('040930f7d96693b7b780ad376ef9c92b0a20784588b3f577adbd3cd0ef68d11a')


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
