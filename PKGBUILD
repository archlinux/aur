# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
pkgver=2.5.4
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=(GPL-3.0-only Apache-2.0)

makedepends=(python-build python-installer python-poetry-core python-wheel)
depends=(python-bleak python-dotmap python-protobuf python-pexpect python-print-color python-pypubsub python-pyqrcode python-pyserial python-pyyaml python-requests python-setuptools python-tabulate python-timeago)
optdepends=('python-pytap2: TUN tunnel support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3bb813cc7e80471ac326c1fbe0d2ca9214c3d5d934531855d83c4ae09a5549c1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
