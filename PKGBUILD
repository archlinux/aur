# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="anlar"
pkgname="tewi"
pkgver=2.4.1
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
sha256sums=('17a4245be423d572b39a4fe2d75e7bff95e8946eee85d984b27955a8d69b7c16')

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
