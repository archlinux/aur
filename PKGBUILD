# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.60.4
pkgrel=2
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
  'python-importlib_resources'
  'python-pyserial-asyncio'
  'python-voluptuous'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-git-versioning'
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
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
b2sums=('8dcc6dc6c24ecef3f171e73dd539504d27ddb6728d0cb6b20273b9d45308cebdf5f789baf90c448c0865856302d2e2862c5115de2960c2146f46e874400afcda')

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
