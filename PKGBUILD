# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.44.1
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
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-cov'
  'python-pytest-timeout'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
sha512sums=('dec588915d9c7976b92331abc8089b51c705d181be31b4693ef6ca6665cfe6942f77ce684d4e084f86703583d4eef009f16f2d50de4fee24577c502c98f79159')

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
