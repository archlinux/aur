# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.0.3
pkgrel=1
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev python-dbus-next pyside6 python-pyusb python-ruamel-yaml)
makedepends=(uv python-installer git)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
install="linux-arctis-manager.install"
sha256sums=('1e0baace1232b29f88208b11aab7d40386c2b0960fe3fb079a55d227bae7859d')

build() {
    # FIX: The folder extracted is Name-Version, not just Name
    cd "${_pkgname}-${pkgver}"
    uv build
}

package() {
    # FIX: Same here
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
