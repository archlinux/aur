# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=zigpy-deconz
pkgname=python-$_pkgname
pkgver=0.16.0
pkgrel=1
pkgdesc='Zigpy support for deCONZ based Zigbee radio devices.'
url='https://github.com/zigpy/zigpy-deconz'
arch=('any')
license=('GPL3')
depends=(
  'python'
  'python-zigpy'
  'python-pyserial-asyncio'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
)
checkdepends=('python-pytest-asyncio')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zigpy/zigpy-deconz/archive/$pkgver.tar.gz")
b2sums=('e905a931bfa10481ea40192cf9698de53fed6bbda5bd797d0648420b38b3092cef5dc3740f2fe320de3bbafc0c49cdca63bc1477e7e45216e6db55fa42b440e7')

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
