# Maintainer: Strykar <strykar@hotmail.com>

_gitpkgname=mktxp
pkgname="python-${_gitpkgname,,}"
pkgver=1.2.12
pkgrel=1
pkgdesc="Prometheus Exporter for Mikrotik RouterOS devices"
arch=('any')
url="https://github.com/akpw/mktxp"
license=('GPL-2.0-or-later')
depends=('python' 'python-prometheus_client' 'python-routeros-api' 'python-configobj' 'python-humanize' 'python-texttable' 'speedtest-cli' 'python-waitress' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/akpw/mktxp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5fe8a6470cbef4c505d1d9c67648a5143a7c6d3a9073ed9632e1f69cbc84b99e')

prepare() {
    cd "${_gitpkgname}-${pkgver}"
    sed -i '25i\import re' mktxp/utils/utils.py
#    sed -i "69s/'/r'/" mktxp/utils/utils.py
}

build() {
    cd "${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitpkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
