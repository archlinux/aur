# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor="rabuchaim"
_pkgname="geoip2fast"

pkgname="python-${_pkgname}"
pkgver=1.2.2
pkgrel=1
pkgdesc="GeoIP2Fast is the fastest GeoIP2 country/city/asn lookup library."

_pypi_package=${_pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pkgname}/"
_url_github="https://github.com/${_pkgauthor}/${_pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
depends=('python' 'python-geoip2')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38815700cedfeb197d51b4b8733b0d4f7965b36de15147c125527124f8b45d6b')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
