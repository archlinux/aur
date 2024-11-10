# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-ble-serial
_name=${pkgname#python-}
pkgver=2.8.0
pkgrel=1
pkgdesc="A tool to connect Bluetooth 4.0+ Low Energy to UART modules and normal PCs/laptops/RaspberryPi."
arch=('any')
url="https://github.com/Jakeler/ble-serial"
license=('MIT')
depends=('python' 'python-bleak' 'python-coloredlogs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("${_name}-$pkgver.tar.gz::https://github.com/Jakeler/ble-serial/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e0023c214bfe62f04d806ffd508b2d5e85a8dbfd38e691897f69ca09658045c5')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
