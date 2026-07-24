# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="codebydivine"
_appname="divine-typed-requests"

pkgname="python-${_appname}"
pkgver=0.1.32
pkgrel=1
pkgdesc="A type-safe HTTP client library with validation and detailed error reporting"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
url="${_url_pypi}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-httpx' 'python-divine-type-enforcer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('c088306584ce41d290f4dcf393dd2e228f5d9bd5f25c8a97a232f4d517bb271c')


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
