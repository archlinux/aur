# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy
pkgname=python-$_pkgname
pkgver=0.73.1
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
b2sums=('9ad1ff6a09bf83e90a658bfafd5ba3aa2051b2e29b7476ad546222176dfc8bcfaec676c517c9250c1460a6f71f387855c29e00df9eeb6538f3c0834c7720c65e')

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
