# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.50.2
pkgrel=2
pkgdesc='Library implementation of the Zigbee Home Automation standard'
url='https://github.com/zigpy/zigpy'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-aiohttp'
  'python-aiosqlite'
  'python-crccheck'
  'python-pycryptodome'
  'python-voluptuous'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
)
checkdepends=(
  'python-asynctest'
  'python-coveralls'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-cov'
  'python-pytest-timeout'
  'python-pytest-asyncio'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
b2sums=('78764ac088f35c3f95dd743a2c1a09a8821be35fce19fe22dac0fedd8b3feffce931271db9dc4df2bf28cbd88af84da81c1c706cb38e423c7828918ab9837522')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
