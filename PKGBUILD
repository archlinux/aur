# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.53.0
pkgrel=1
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
  'python-freezegun'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-cov'
  'python-pytest-timeout'
  'python-pytest-asyncio'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
b2sums=('4009c62af47f281e23970a43cb1c539d009cd8d16d98a005e4749f849ea06de87595835d781541b8b03c01a2931260cfd26d485fac470c15749819a86678ed74')

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
