# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-bleak
_pkgname=bleak
pkgver=0.14.0
pkgrel=1
pkgdesc="Bluetooth Low Energy platform Agnostic Klient for Python"
arch=(any)
url='https://github.com/hbldh/bleak'
license=(MIT)
depends=('python' 'python-dbus-next' 'python-service-identity')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-runner')
makedepends=('python-setuptools' 'bluez-utils')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/hbldh/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('403f65f88e2196ced5b1640f5c92bde6cc9026186267f2861c16a406faa1320addc47aebbe472fd4f48839366f4283cf62e628576daad010293c7e85b8cd43f7')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
	cd $_pkgname-$pkgver

	pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
