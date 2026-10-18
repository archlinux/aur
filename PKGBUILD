# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="anlar"
pkgname="tewi"
pkgver=3.0.0
pkgrel=1
pkgdesc="Text-based interface for BitTorrent clients (Transmission, qBittorrent, Deluge)"

_pypi_package=${pkgname}-torrent
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-pyperclip' 'python-rich' 'python-textual' 'python-platformdirs' 'python-requests' 'python-debugpy' 'python-qbittorrent-api' 'python-transmission-rpc' 'python-geoip2fast')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d4f7ddf21d4e6979516fa32e8b17b0ad9bd55c9e06cf3493c43defa5cc29750')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
