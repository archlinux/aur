# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.78.1
pkgrel=1
pkgdesc='Library implementation of the Zigbee Home Automation standard'
url='https://github.com/zigpy/zigpy'
arch=('any')
license=('GPL-3.0-or-later')
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
  'python-aioresponses'
  'python-asynctest'
  'python-freezegun'
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-asyncio'
  'python-pytest-cov'
  'python-pytest-timeout'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy/archive/$pkgver.tar.gz")
b2sums=('d290aa997a968d79e41881eade4bc6cfe95dd3c87c307535ad9e6246d54f3648fa53e42deb0e1f3b4ce00b67a0891f34109d08b25afa5b5078f0b55c830f3a26')

build() {
  cd $_pkgname-$pkgver
  perl -pi -e 's{setuptools-git-versioning<2}{setuptools-git-versioning}' pyproject.toml
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest -k 'test_quirks_v2'
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
