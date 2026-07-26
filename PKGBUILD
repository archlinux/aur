# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: vantu5z <vantu5z@mail.ru>

_appauthor="toastdriven"
_appname="shell"

pkgname="python-${_appname}"
pkgver=1.0.1
pkgrel=1
pkgdesc="A better way to run shell commands in Python."

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('BSD')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('d114d74338877a8739ede11ef5466e950c5820a93d7dd20aa96408b2e353af0c')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
