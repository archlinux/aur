# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="wasi-master"
pkgname="charinfo"
pkgver=0.2.0
pkgrel=1
pkgdesc="A command line tool to view detailed information about a character"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

_execname=${pkgname}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-rich')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36fd977827267b89c0e0609a9f5ebbedf0434133bdc036864712b488da8b4988')

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
