# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
pkgver=2.7.6
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
sha256sums=('19b97d46f3853a7166a9015f7e4c96d1f0dccd50fdebf4f3b8e6b1ce14dabf4d')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
