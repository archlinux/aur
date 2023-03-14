# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.53.3
pkgrel=1
pkgdesc='Library implementation of the Zigbee Home Automation standard'
url='https://github.com/zigpy/zigpy'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-aiohttp'
  'python-aiosqlite'
  'python-async-timeout'
  'python-crccheck'
  'python-cryptography'
  'python-pycryptodome'
  'python-pyserial-asyncio'
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
  'python-freezegun'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-timeout'
  'python-ruff'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
b2sums=('0a99f3b7c0c4ea58a11cfffeb7eba7f7fce86256c7abca5bee4e322ce0bdf76a8c9e5de106ca64698895548bf418d0035ccb44f47f6e486dea1e9701cdf05e7b')

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
