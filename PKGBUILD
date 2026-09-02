# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="Kaia-Alenia"
pkgname="alenia-zenith"
pkgver=1.2.9
pkgrel=1
pkgdesc="Zero-latency boot infrastructure for Python 3.14+ utilizing speculative dependency pre-loading and free-threading"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package#alenia-}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d81f08be6337c29788ead9ecb895005e10f9fda264478223cfcce1f5718cddc')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
