# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-ble-serial
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=2
pkgdesc="A tool to connect Bluetooth 4.0+ Low Energy to UART modules and normal PCs/laptops/RaspberryPi."
arch=('any')
url="https://github.com/Jakeler/ble-serial"
license=('MIT')
depends=('python' 'python-bleak' 'python-coloredlogs' 'python-hatchling')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("${_name}-$pkgver.tar.gz::https://github.com/Jakeler/ble-serial/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51942deedde01ffc864f128cdf87eec76988ea38f100ecd6100e610140155cdb')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
