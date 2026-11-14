# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="tox-dev"
_appname="python-sbom"

pkgname=${_appname}
pkgver=0.3.1
pkgrel=1
pkgdesc="A high level archive handler for Python"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling' 'python-zipremove')
depends=('python' 'python-packaging' 'python-packageurl' 'python-setuptools' 'python-installer' 'python-pdm' 'python-pdm-backend' 'python-hatchling' 'python-zipremove' 'python-license-expression')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('37d0fa3d0a16fddc3d88099e147e164ddb3055e8bc3424506ef41dd80f723a73')


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
