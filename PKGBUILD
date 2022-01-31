# Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=python-bme280
_pkgname=bme280
pkgver=0.6
pkgrel=1
pkgdesc="Python Driver for the BME280 Temperature/Pressure/Humidity Sensor from Bosch "
url="https://github.com/kbrownlees/bme280"
arch=("any")
license=("custom")
depends=("python" "i2c-tools")
conflicts=("bme280")
makedepends=('python-setuptools')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/kbrownlees/bme280/archive/v${pkgver}.tar.gz)
sha512sums=("e33c169ef21d127b77405e9e17d26a3b6d0a6afa2340f447df2d61b063731860d7c67807fbf0c45db6bef4d027df3c15fa567d8788fa2da1780b4956f7783ca0")

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  make test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
