# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="eelkevdbos"
pkgname="run-concurrently"
pkgver=0.2.5
pkgrel=1
pkgdesc="A pure python, zero dependency, package to run a list of commands concurrently"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ca83b9888ba80451d0f81f6afba7355898d5933e2abefc0a60cb15ae07b98a3')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
