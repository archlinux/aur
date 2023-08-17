# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.11.4
pkgrel=1
pkgdesc='Zigpy support for common Texas Instruments ZNP radio modules'
url='https://github.com/zigpy/zigpy-znp'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-zigpy'
  'python-voluptuous'
  'python-coloredlogs'
  'python-jsonschema'
  'python-pyserial-asyncio'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools-git-versioning-git'
)
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-znp/archive/v$pkgver.tar.gz")
b2sums=('66d5ca0460abe0861beea6ae79e7f1149014b782307757f2128ba82e24a2d9117850d108118fe20df0b20a08cf8af11e5c0824d7f5ff4c8d108612a6fae96ffd')

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
