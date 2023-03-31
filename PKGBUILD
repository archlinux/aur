# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-znp
pkgname=python-$_pkgname
pkgver=0.10.0
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
)
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-znp/archive/v$pkgver.tar.gz")
b2sums=('81eb181be70b8a12f7a87082ae2472cd5c6e6b8cfb17c03e645cf1e28f67ea4161a32836962cdb80782b4d35e8d235957b19e22a7cf9e5db42788aa8b352fc7a')

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
