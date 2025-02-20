# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
pkgver=2.5.12
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"
license=(GPL-3.0-only)
makedepends=(python-build python-installer python-poetry-core python-wheel)
depends=(python python-bleak python-protobuf python-pypubsub python-pyserial python-pyyaml python-requests python-setuptools python-tabulate python-platformdirs python-packaging)
optdepends=('python-pytap2: TUN tunnel support'
            'python-dotmap: Use of the meshtastic.test namespace'
            'python-print-color: Colored log output'
            'python-pyqrcode: Output of QR codes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f7b8ddda175e14c6b6ca53b4c9c1eddd7d87950062a5fb5ca6071de8fb373f5a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
